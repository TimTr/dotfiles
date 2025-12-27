#!/bin/zsh

# Check if both parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

SOURCE="$1"
DEST="$2"
BACKUP_DIR="$DEST/past-backups"

# Validate source directory exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory '$SOURCE' does not exist"
    exit 1
fi

# Create destination and backup directories if they don't exist
mkdir -p "$DEST"
mkdir -p "$BACKUP_DIR"

# Function to move file to backup with date if needed
backup_file() {
    local file="$1"
    local basename=$(basename "$file")
    local backup_path="$BACKUP_DIR/$basename"
    
    if [ -f "$backup_path" ]; then
        # Get file modification date
        local file_date=$(date -r "$file" "+%Y%m%d-%H%M%S")
        local filename="${basename%.*}"
        local extension="${basename##*.}"
        
        # Handle files without extension
        if [ "$filename" = "$extension" ]; then
            backup_path="$BACKUP_DIR/${basename}_${file_date}"
        else
            backup_path="$BACKUP_DIR/${filename}_${file_date}.${extension}"
        fi
    fi
    
    mv "$file" "$backup_path"
}

# Find files in destination that will be overwritten or don't exist in source
find "$DEST" -type f -not -path "$BACKUP_DIR/*" | while read -r dest_file; do
    relative_path="${dest_file#$DEST/}"
    source_file="$SOURCE/$relative_path"
    
    # If source file doesn't exist or is different, backup the destination file
    if [ ! -f "$source_file" ] || ! cmp -s "$source_file" "$dest_file"; then
        backup_file "$dest_file"
    fi
done

# Sync files from source to destination
rsync -av --exclude='past-backups' "$SOURCE/" "$DEST/"

echo "Sync complete. Backups stored in $BACKUP_DIR"

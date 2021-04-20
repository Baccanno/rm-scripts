#This script may take some time to execute (~1min)
#It will simply move and delete all files that where marked as deleted in their metadata.
#TODO : dry-run option to list what would be moved/deleted
#TODO : move-only option without deletion
cd ~/.local/share/remarkable/xochitl/
find -type f -exec grep -l '"deleted": true' {} \; > ../deletedMeta
mkdir ../deleted
cat ../deletedMeta | awk '{ l=length($0); s=substr($0,3,l-11); print s}' | xargs -i find . -name {}* | xargs -i mv {} ../deleted
rm -r ../deleted 
cd ~
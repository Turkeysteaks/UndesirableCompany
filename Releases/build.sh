cp ../icon.png .
cp ../README.md .
cp ../CHANGELOG.md .
cp ../manifest.json .
cp -r ../BepInEx ./BepInEx
cp -r ../config ./config

output="UndesirableCompany_v$(jq -r .version_number manifest.json).zip"
echo "${output}"
#Compress everything except for this file into a .zip
zip -r ./${output} ./* -x ./build.* -x ./*.zip

#jq -r .version_number manifest.json
#CAREFUL. Deletes everything in the folder except for the new zip and this file.
find ../Releases/* -not -name 'build.sh' -not -name ${output} -delete

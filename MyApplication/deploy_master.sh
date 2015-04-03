incrementVersion()
{
echo 'increment build version'
file="app/version.properties"
versionKey="VERSION_CODE"

while IFS="=" read -r key value; do
case "$key" in
$versionKey) versionCode="$value" ;
esac
done < "$file"
echo 'old version' $versionCode
versionCode=$((versionCode+1))
echo 'new version' $versionCode
echo $versionKey=$versionCode > "app/version.properties"

}



setBuildVersion(){
CIRCLE_SHA1
    versionKey="VERSION_CODE"    
    touch "app/version.properties"
    echo $versionKey=$CIRCLE_BUILD_NUM > "app/version.properties"
}

buildDebug(){
echo 'upload debug build to Fabric'
    ./gradlew assembleDebug crashlyticsUploadDistributionDebug
}

commitNewVersion(){
git commit -m 'update build version [ci skip]'
git push
}

echo 'start building android'
incrementVersion
#setBuildVersion
buildDebug
commitNewVersion
echo 'stop building android'

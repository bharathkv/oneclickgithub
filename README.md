# Launch in AWS Mobile Hub
1. Use this button to import the AWS Mobile Hub configuration into your AWS Mobile Hub console 
<a target="_blank" href="https://console.aws.amazon.com/mobilehub/home?#/?config=https://github.com/bharathkv/oneclickgithub/blob/master/photoapptemplate.zip">
<span>
    <img height="100%" src="https://s3.amazonaws.com/deploytomh/button-deploy-aws-mh.png"/>
</span>
</a>

2. Please log into the AWS Mobile Hub console if your prompted to login.
3. On logging into the AWS Mobile Hub console you will be provided with an option to name your imported project.
4. After importing the configuration into your AWS Mobile Hub console, download the sample app from the Getting Started instructions in the Integrate page.
5. You can also integrate the AWS Mobile SDK into your application from the Integrate page.
6. You can also configure and add/remove any backend configuration for your mobile application from your project.


# Instructions for creating a Github sample to import projects from .zip file into Mobile Hub
1. Please export your AWS Mobile Hub project by navigating to the project list in the Mobile Hub console and choosing Export in the upper right of the card for the project you want to export.
2. Commit the .zip file to your Github repository.
3. Create a link/button in the Github README file pointing to the following url: https://console.aws.amazon.com/mobilehub/home?#/?config=<GITHUB_URL_TO_ZIP_FILE>

# Instructions for creating a Github sample to import projects from .yml file into Mobile Hub
1. Please export your AWS Mobile Hub project by navigating to the project list in the Mobile Hub console and choosing Export in the upper right of the card for the project you want to export.
2. Extract the .yml from the .zip file.
3. Commit the .yml file to your Github repository.
4. Create a link/button in the Github README file pointing to the following url: https://console.aws.amazon.com/mobilehub/home?#/?config=<GITHUB_URL_TO_YAML_FILE>

# Use the standard Microsoft ASP.NET Core container
FROM microsoft/aspnetcore
 
# Copy code from the "KubeNet/bin/Release/PublishOutput" folder to the "/kubenet" folder in our container
WORKDIR /app
COPY ./imgfiles/ .
 
# Expose port 80 for the Web API traffic
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80
 
# Run the dotnet application against a DLL from within the container
# Don't forget to publish your application or this won't work
ENTRYPOINT ["dotnet", "KubeNet.dll"]

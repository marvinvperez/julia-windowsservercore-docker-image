FROM microsoft/windowsservercore:latest

#install chocolatey package manager
RUN ["powershell -NoProfile -ExecutionPolicy Bypass -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"]

#Install Julia version 0.5.0
#Default install path C:/Users/containerAdministrator/AppData/Local/julia-0.5.0/bin
RUN ["choco install julia --version 0.5.0 -y"]

#Set environment variables for Julia
ENV HOMEDRIVE=C:
ENV HOMEPATH=/Users/containerAdministrator

#Verify julia installation
RUN echo "Prints out a summary"
RUN C:/Users/containerAdministrator/AppData/Local/julia-0.5.0/bin/julia.exe -e Pkg.status()

CMD ["C:/Users/containerAdministrator/AppData/Local/julia-0.5.0/bin/julia.exe"]

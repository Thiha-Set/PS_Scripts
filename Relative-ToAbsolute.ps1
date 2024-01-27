$fileName = Read-Host "Enter the fileName you want to convert to an absolute path (include file extension in the name)";

((pwd).Path+"\$($fileName)").replace("\","/");
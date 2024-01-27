# @: Quickly converts the absolute path to a fileName in the current directory to a relative path
$fileName = Read-Host "Enter the fileName you want to convert to an absolute path (include file extension in the name)";

((pwd).Path+"\$($fileName)").replace("\","/");
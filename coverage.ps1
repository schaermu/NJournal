pushd

cd artifacts\bin\NJournal.Web\Debug\dnx451

$env:KRE_APPBASE = "../../../../../src/NJournal.Tests"

iex ((Get-ChildItem ($env:USERPROFILE + '\.dnx\packages\OpenCover'))[0].FullName + '\OpenCover.Console.exe' + ' -register:user -target:"' + (Get-ChildItem ($env:USERPROFILE + '\.dnx\runtimes'))[0].FullName + '\bin\dnx.exe" -targetargs:". test" -output:coverage.xml -skipautoprops -returntargetcode -filter:"+[NJournal*]*"')

iex ((Get-ChildItem ($env:USERPROFILE + '\.dnx\packages\ReportGenerator'))[0].FullName + '\ReportGenerator.exe -reports:coverage.xml -targetdir:.')

./index.htm

popd
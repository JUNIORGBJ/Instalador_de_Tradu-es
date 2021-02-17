; Script para Tradu��o de Desperados 3.

#define MyAppName "Tradu��o Desperados 3"
#define MyAppVersion "2.0"
#define MyAppPublisher "JUNIORGBJ & Contributors"
#define MyAppURL "https://github.com/JUNIORGBJ/DESPERADOS_3_PT-BR"

[Setup]
AppId={{EE2317BF-2C30-4780-ADE1-3A5F597C4D31}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Tradu��es gBj
AppVerName=Tradu��o Desperados 3
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=true
DisableProgramGroupPage=true
DefaultGroupName={#MyAppName}
AllowNoIcons=true
LicenseFile=C:\GBJ\Termo de Uso.txt
InfoBeforeFile=C:\GBJ\Cr�ditos dos Tradutores.txt
SetupIconFile=C:\GBJ\Desperados III.ico
DisableWelcomePage=no
OutputBaseFilename=Traducao_Desperados_3
Compression=lzma
SolidCompression=true
WizardStyle=modern
WindowShowCaption=false
WindowStartMaximized=false
WindowResizable=false
WindowVisible=false
DisableStartupPrompt=true
Uninstallable=false
CreateAppDir=false

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Code]
var
  CopyDirPage: TInputDirWizardPage;

procedure InitializeWizard();
begin
  CopyDirPage :=
    CreateInputDirPage(wpSelectDir, 'Selecionar local de instala��o', '',  '', False, '');
  CopyDirPage.Add('Use a pasta padr�o Steam ou procure a pasta onde cont�m o arquivo "Desperados III.exe"');
  CopyDirPage.Values[0] := ExpandConstant('{pf32}\Steam\steamapps\common\Desperados III');
end;

procedure ExitProcess(exitCode:integer);
 external 'ExitProcess@kernel32.dll stdcall';

function CopyDir(Params: string): string;
begin
  Result := CopyDirPage.Values[0];
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
 if CurStep = ssInstall then
  begin
   if not FileExists(ExpandConstant(CopyDirPage.Values[0] + '\Desperados III.exe')) then begin
     MsgBox('O execut�vel Desperados III.exe n�o foi encontrado nessa pasta. Rode a instala��o novamente apontando para a pasta correta.', mbError, MB_OK);
     ExitProcess(7);
   end;
 end;
end;

[Files]
Source: C:\GBJ\keyboard\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\keyboard; Flags: ignoreversion recursesubdirs createallsubdirs
Source: C:\GBJ\loca\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\loca; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: {group}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}

[Messages]
WizardLicense=Termos de Uso
LicenseLabel3=Por favor leia o seguinte Termo de Uso. Voc� deve aceitar os termos de uso antes de continuar com a instala��o.
LicenseAccepted=Eu &aceito os termos
LicenseNotAccepted=Eu &n�o aceito os termos
WizardInfoBefore=Cr�ditos da Tradu��o
WelcomeLabel1=Bem-vindo ao instalador da Tradu��o de Desperados 3
WelcomeLabel2=Este assistente guiar� voc� atrav�s da instala��o da [name/ver] em seu computador. Para continuar, clique em Avan�ar.
ClickNext=AVISO: � recomendado que voc� feche o jogo e fa�a um BACKUP dos arquivos da pasta \Desperados III_Data\StreamingAssets\loca antes de iniciar a Instala��o. Isto tornar� poss�vel atualizar ou restaurar os arquivos do jogo sem nenhum problema.
ReadyLabel1=O instalador est� agora pronto pra come�ar a instalar a [name] no seu computador.
ReadyLabel2b=AVISO: %nVerifique se o caminho escolhido para a instala��o encontra-se o arquivo execut�vel "Desperados III.exe".%n%nClique em Instalar pra concluir a instala��o ou clique em Voltar se voc� quer alterar o caminho da pasta a ser instalada.%n%n
InstallingLabel=Por favor espere enquanto o instalador instala a [name] no seu computador.
FinishedHeadingLabel=A instala��o da [name] foi conclu�da
FinishedLabel=O instalador terminou de instalar a [name] no seu computador. O jogo j� pode ser iniciado. Divirta-se.
InfoBeforeClickLabel=Lista dos participantes do projeto
InfoBeforeLabel=Por favor leia as seguintes informa��es antes de avan�ar.
ExitSetupMessage=A Instala��o n�o foi conclu�da. Se voc� sair agora a Tradu��o n�o ser� instalada.%n%nVoc� pode executar o instalador de novo outra hora pra completar a instala��o.%n%nSair do instalador?

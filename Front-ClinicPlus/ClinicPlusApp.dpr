program ClinicPlusApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ClinicPlus.Form in 'C:\Users\aluno\Downloads\ClinicPlus.Form.pas' {ClinicPlusForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClinicPlusForm, ClinicPlusForm);
  Application.Run;
end.

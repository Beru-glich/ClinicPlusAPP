unit ClinicPlus.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TabControl, FMX.ListBox, FMX.MultiView, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  System.JSON, FMX.Edit;

type
  TClinicPlusForm = class(TForm)
    TopRCT: TRectangle;
    MenuBTN: TButton;
    Label1: TLabel;
    AtualizarBTN: TButton;
    ButtonRCT: TRectangle;
    ScheduleLYT: TLayout;
    SchedulePTH: TPath;
    HomeLYT: TLayout;
    HomePTH: TPath;
    HistoryLYT: TLayout;
    HistoryPTH: TPath;
    AnimeLYT: TLayout;
    AnimeRCT: TRectangle;
    MultiView1: TMultiView;
    MenuList: TListBox;
    ListBoxItem1: TListBox;
    ListBoxItem4: TListBox;
    ListBoxItem3: TListBox;
    ListBoxItem2: TListBox;
    ContentTBC: TTabControl;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    HistoryLTV: TListView;
    Layout1: TLayout;
    Circle1: TCircle;
    NameLBL: TLabel;
    CPFLBL: TLabel;
    ClienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    ClienteMTBidcliente: TAutoIncField;
    ClienteMTBNome: TStringField;
    ClienteMTBCpf: TStringField;
    ClienteMTBNascimento: TDateTimeField;
    ClienteMTBFoto: TBlobField;
    AgendamentoMTBidagendamento: TAutoIncField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    HistoricoMTBidagendamento: TAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBdata_confirmação: TDateTimeField;
    HistoricoMTBdate_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBidcliente: TIntegerField;
    ScheduleLTV: TListView;
    LinkListControlToField1: TLinkListControlToField;
    TLabel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBoxItem5: TListBox;
    EntrarBTN: TButton;
    IDEDT: TEdit;
    CPFEDT: TEdit;
    LoginFotoCIR: TCircle;

    procedure ScheduleLTVClick(Sender: TObject);

    procedure HistoryLYTClick(Sender: TObject);
    procedure HomeLYTClick(Sender: TObject);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScheduleLTVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure EntrarBTNClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

    procedure GetAgendamentoAtivo(const AToken: String);//requisiçao de agendamentos
    procedure GetHistorico(const AToken: String);

    procedure GetCliente(const AToken: String);
    procedure LoadCliente(const AToken: String);

    procedure ChangeSchedule(const AID: Integer; JSON: TJSONObject);
    procedure Login(const ID, CPF: String);
  end;
const
//EnderecoServidor= 'http://192.168.137.1:9000/';
EnderecoServidor = 'http://localhost:9000/';

var
  ClinicPlusForm: TClinicPlusForm;
  //UserID: Integer;//usado para facilitar os teste
  {
   Token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'+
  '.eyJpYXQiOjE3MzMyMjU5MjIsImV4cCI6MTczMzMxMjMyMiwiaXNzIjoibG9jYWxo'+
  'b3N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTklMU09OIE1PUklMSU4iLCJjcGYiOiI0N'+
  'DQuNDQ0LjQ0NC00NCIsIm5hc2NpbWVudG8iOiIxOFwvMTBcLzE5Nz'+
  'IifQ.Ee7ayHrZGO_XT0nEd8JiZ8DDqwrnXj3EEVTc2TTaqBY';
  }
  Token: String;

implementation
uses FMX.Ani , RESTRequest4D, DataSet.Serialize,DataSet.Serialize.Adapter.RESTRequest4D, System.Threading;

{$R *.fmx}




procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);
// AUTOALIZAR BOTAO ON CLICK--------------------------------------------------
begin
  TTask.Run(procedure
  begin
    GetAgendamentoAtivo(Token);
    GetHistorico(Token);
    //LoadCliente(Token);
  end);

end;



procedure TClinicPlusForm.ChangeSchedule(const AID: Integer; JSON: TJSONObject);
//CHANGESCHEDULE
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')
    .ResourceSuffix(AID.ToString)
    .AddBody(JSON, False)
    .Accept('application/json')
    .Put;

end;

procedure TClinicPlusForm.EntrarBTNClick(Sender: TObject);
begin
  if(IDEDT.Text = '')or(CPFEDT.Text ='')Then
  raise Exception.Create('Informe o ID e o CPF');

  TTask.Run(procedure
      begin
         Login(IDEDT.Text, CPFEDT.Text);

         LoadCliente(Token);
         GetAgendamentoAtivo(Token);
         GetHistorico(Token);

         TThread.Synchronize(TThread.Current, procedure  begin
         LoginFotoCIR.Fill.Bitmap.Assign(Circle1.Fill.Bitmap);
         MultiView1.HideMaster;
      end);
    end);


end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndLower;

  AnimeRCT.Position.X := HomeLYT.Position.X;

{  TTask.Run(procedure
  begin
    LoadCliente(Token);
    GetAgendamentoAtivo(Token);
    GetHistorico(Token);
  end);
}
  MultiView1.ShowMaster;
  IDEDT.SetFocus;
end;

procedure TClinicPlusForm.GetAgendamentoAtivo(const AToken: String);
//GET AGENDAMENTO ATIVO
begin
       TRequest.New.BaseURL(EnderecoServidor+'agendamento')
         .AddHeader('Authorization', AToken, [poDoNotEncode])
         .AddParam('fg_status','a')
         //.AddParam('idcliente',User.ToString)
         .Accept('aplication/json')
         .Adapters(TDataSetSerializeAdapter.New(AgendamentoMTB))
         .Get;

         //showmessage('ativo');
end;



procedure TClinicPlusForm.GetCliente(const AToken: String);
//GET CLIENTE
begin
  TRequest.New.BaseURL(EnderecoServidor+'cliente')
    .AddHeader('Authorization', AToken, [poDoNotEncode])
    //.ResourceSuffix(ID.ToString)
    .Accept('application/json')
    .Adapters(TDataSetSerializeAdapter.New(ClienteMTB))
    .Get;

end;

procedure TClinicPlusForm.GetHistorico(const AToken: String);
//GET HISTORICO ATIVO
begin
       TRequest.New.BaseURL(EnderecoServidor+'agendamento')
          .AddHeader('Authorization', AToken, [poDoNotEncode])
         //.AddParam('idcliente',User.ToString)
         .Accept('aplication/json')
         .Adapters(TDataSetSerializeAdapter.New(HistoricoMTB))
         .Get;


end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
// HISTORY ON CLICK--------------------------------------------------
begin

TAnimator.AnimateFloat( AnimeRCT,'position.x',HistoryLYT.Position.x, 0.5, TAnimationType.Out, TInterpolationType.Bounce);


  ContentTBC.SetActiveTabWithTransitionAsync(HistoryTBC, TTabTransition.Slide, TTabTransitionDirection.Normal, nil );

end;



procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
// HOME ON CLICK--------------------------------------------------
var TabDirection: TTabTransitionDirection;

begin

if ContentTBC.ActiveTab.Index > HomeTBC.Index then
  TabDirection := TTabTransitionDirection.Reversed
else
  TabDirection :=TTabTransitionDirection.normal;



TAnimator.AnimateFloat( AnimeRCT,'position.x',HomeLYT.Position.x, 0.5, TAnimationType.Out, TInterpolationType.Bounce);


  ContentTBC.SetActiveTabWithTransitionAsync(HomeTBC, TTabTransition.Slide, TabDirection, nil );

end;




procedure TClinicPlusForm.LoadCliente(const AToken: String);
// LOAD CLIENTE

var
FotoStream: TMemoryStream;
BrushBmp: TBrushBitmap;

begin
  //GetCliente(ID);
  GetCliente(AToken);


  TThread.Synchronize(TThread.CurrentThread, procedure
  begin
   NameLBL.Text := ClienteMTBnome.AsString;
   CPFLBL.Text := ClienteMTBCPF.AsString;

   FotoStream := TMemoryStream.Create;
   BrushBmp := TBrushBitmap.Create;

   try
     ClienteMTBFoto.SaveToStream(FotoStream);
     BrushBmp.Bitmap.LoadFromStream(FotoStream);
     BrushBmp.WrapMode := TWrapMode.TileStretch;
     Circle1.Fill.Bitmap.Assign(BrushBmp);

   finally
      FotoStream.Free;
      BrushBmp.Free;
   end;

  end);
end;

procedure TClinicPlusForm.Login(const ID, CPF: String);
var
  JSON: TJSONObject;
  Resposta: IResponse;
begin
   JSON :=TJSONObject.Create;
   try
     JSON.AddPair('idcliente',ID);
     JSON.AddPair('cpf', cpf);
     try
       Resposta :=TRequest.New
                    .BaseURL(EnderecoServidor+'token')
                    .AddBody(JSON, False)
                    .Accept('application/json')
                    .Post;
        if Resposta.StatusCode = 200 then begin
          Token := 'Bearer' +Resposta.Content;
        end
        else begin
          ShowMessage('Falha na autenticação: '+Resposta.Content);
        end;
      except
        on E:Exception do begin
          ShowMessage('Falha no login: '+E.Message);
        end;
     end;
   finally
       JSON.Free;
   end;
end;

procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
  //SHEDULE ON CLICK
  var
  JSON:TJSONObject;
begin
  if AObject.Name.ToLower = 'confirmabutton' then
  begin
    AgendamentoMTB.Edit;
    AgendamentoMTBfg_status.AsString := 'C';
    AgendamentoMTBdata_confirmacao.Value := Now;
    AgendamentoMTB.Post;
    JSON := AgendamentoMTB.ToJSONObject();
    ChangeSchedule(AgendamentoMTBidagendamento.Value, JSON);
    JSON.Free;
  end;

  if AObject.Name.ToLower = 'cancelabutton' then
  begin
    AgendamentoMTB.Edit;
    AgendamentoMTBfg_status.AsString := 'I';
    AgendamentoMTBdata_confirmacao.Value := Now;
    AgendamentoMTB.Post;
    JSON :=AgendamentoMTB.ToJSONObject();
    ChangeSchedule(AgendamentoMTBidagendamento.Value, JSON);
    JSON.Free;
  end;

  TTask.Run(procedure
    begin
    Sleep(50);
    AgendamentoMTB.EmptyDataSet;
    HistoricoMTB.EmptyDataSet;
    GetAgendamentoAtivo(Token);
    GetHistorico(Token);
    end);
end;

procedure TClinicPlusForm.ScheduleLTVClick(Sender: TObject);
// SCHEDULE ON CLICK--------------------------------------------------
begin
//Animação do retangulo de navegação
TAnimator.AnimateFloat( AnimeRCT,'position.x', ScheduleLYT.Position.x, 0.5, TAnimationType.Out, TInterpolationType.Bounce);


  ContentTBC.SetActiveTabWithTransitionAsync(ScheduleTBC, TTabTransition.Slide, TTabTransitionDirection.Reversed, nil );


end;

procedure TClinicPlusForm.ScheduleLTVUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
  //ON UPDATE OBJECTS
begin
   AItem.Objects.DrawableByName('ConfirmaButton').Height := 37;
   Aitem.Objects.DrawableByName('CancelaButton').Height := 37;

end;

end.

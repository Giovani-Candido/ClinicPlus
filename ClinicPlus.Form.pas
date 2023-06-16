unit ClinicPlus.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListBox, FMX.MultiView, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.JSON,
  FMX.Edit;

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
    MenuLST: TListBox;
    ContentTBC: TTabControl;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    ScheduleLTV: TListView;
    HistoryLTV: TListView;
    Layout1: TLayout;
    Circle1: TCircle;
    NameLBL: TLabel;
    cpfLBL: TLabel;
    ClienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    ClienteMTBidcliente: TAutoIncField;
    AgendamentoMTBidagendamento: TAutoIncField;
    HistoricoMTBidhistorico: TAutoIncField;
    ClienteMTBnome: TStringField;
    ClienteMTBcpf: TStringField;
    ClienteMTBnascimento: TDateTimeField;
    ClienteMTBfoto: TBlobField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidcliente: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    HistoricoMTBidagendamento: TAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBidadmin: TIntegerField;
    HistoricoMTBdata_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_confirmacao: TDateTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    Label2: TLabel;
    Label3: TLabel;
    IDEDT: TEdit;
    Label4: TLabel;
    CPFEDT: TEdit;
    EntrarBTN: TButton;
    LoginFotoCIR: TCircle;
    procedure ScheduleLYTClick(Sender: TObject);
    procedure HomeLYTClick(Sender: TObject);
    procedure HistoryLYTClick(Sender: TObject);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure EntrarBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure GetCliente(const AToken:String);
    procedure LoadCliente (const AToken:String);
    procedure GetAgendamento (const AToken:String);
    procedure GetHistorico (const AToken:String);
    procedure ChangeSchedule (const AID: Integer; JSON: TJSONObject);
    procedure Login (const ID, CPF:String);
  end;
const
//EnderecoServidor = 'http://192.168.137.1:/';
EnderecoServidor = 'http://localhost:9000/token';
//Token = 'Bearer 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'+
//'.eyJpYXQiOjE2ODU3MDAxNzIsImV4cCI6MTY4NTc4NjU3MiwiaXNzIjoibG9jY'+
//'Wxob3N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTklMU09OIE1PUklMSU4iLCJjcGY'+
//'iOiI0NDQuNDQ0LjQ0NC00NCIsIm5hc2NpbWVudG8iOiIxOFwvMTBcLzE5NzIifQ.-SwXv24JLFOINO8Vv5Jr49D74bItx45_IDB4gCB2-0U';
var
  ClinicPlusForm: TClinicPlusForm;
  UsuarioID: Integer;
  Token: String;

implementation

uses FMX.Ani, RESTRequest4D, DataSet.Serialize, System.Threading;

{$R *.fmx}

procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);
begin
 LoadCliente    (Token);
 GetAgendamento (Token);
 GetHistorico   (Token);
end;

procedure TClinicPlusForm.ChangeSchedule(const AID: Integer; JSON: TJSONObject);
begin
   TRequest.New.BaseURL (EnderecoServidor+'agendamento')
   .ResourceSuffix(AID.ToString)
   .AddBody(JSON,False)
   .Accept('application/json')
   .Put;
end;

procedure TClinicPlusForm.EntrarBTNClick(Sender: TObject);
begin
if (IDEDT.Text= '') or (CPFEDT.Text = '') then
 raise Exception.Create('Informe o ID e o CPF');
 TTask.Run(procedure
 begin
   Login (IDEDT.Text, CPFEDT.Text);
   LoadCliente(Token);
   GetAgendamento(Token);
   GetHistorico(Token);

   TThread.Synchronize(TThread.Current, procedure begin
    //copia foto do usuario
   LoginFotoCIR.Fill.Bitmap.Assign(Circle1.Fill.Bitmap);
   MultiView1.HideMaster;
   end );
 end);
end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
   Tdatasetserializeconfig.GetInstance.CaseNameDefinition:= Tcasenamedefinition.cndLower;
   AnimeRCT.Position.X := HomeLYT.Position.X;
           // UsuarioID :=1;
  // TTask.Run(procedure
  //begin
  // LoadCliente(Token);
  // GetAgendamento(Token);
  // GetHistorico(Token);
  // end);
  MultiView1.ShowMaster;
  IDEDT.SetFocus;

end;

procedure TClinicPlusForm.GetAgendamento(const AToken:String);
begin
   TRequest.New.BaseURL (EnderecoServidor+'agendamento')
   .AddHeader('Authorization', AToken, [poDoNotEncode]  )
   .AddParam('fg_status', 'a')    //
//   .AddParam('id_cliente', Usuario.ToString)//
   .Accept('application/json')
   .DataSetAdapter(AgendamentoMTB)
   .Get;

end;

procedure TClinicPlusForm.GetCliente(const AToken:String);

begin
  TRequest.New.BaseURl(EnderecoServidor+'cliente')
  .AddHeader('Authorization', AToken, [poDoNotEncode]  )
//    .resourceSuffix (ID.ToString)                    //
    .Accept('application/json')
    .DataSetAdapter(ClienteMTB)
    .Get;
end;


procedure TClinicPlusForm.GetHistorico(const AToken:String);
begin
    TRequest.New.BaseURL(EnderecoServidor+'agendamento')
    .AddHeader('Authorization', AToken, [poDoNotEncode]) // URL
//    .AddParam('idcliente',User.ToString)     //
    .Accept('application/json')
    .DataSetAdapter(HistoricoMTB)
    .Get;
end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
begin
Tanimator
   .AnimateFloat  (AnimeRct,
                   'Position.X',
                   HistoryLYT.Position.X,
                   0.5,
                   TanimationType.Out,
                   TInterpolationType.Bounce);

   ContentTBC
   .SetActiveTabWithTransition (HistoryTBC,
                                TTabTransition.Slide,
                                TTabTransitionDirection.Normal);
     //                           , Nil);
end;

procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
        var
        transicao: TTabTransitionDirection;
begin
       if contentTBC.activeTAB.Index >homeTBC.index then
begin
       transicao:= TTabTransitionDirection.Reversed;
end
else
begin
     transicao:=TTabTransitionDirection.Normal;
end;

Tanimator
   .AnimateFloat  (AnimeRct,
                   'Position.X',
                   HomeLYT.Position.X,
                   0.5,
                   TanimationType.Out,
                   TInterpolationType.Bounce);

   ContentTBC
   .SetActiveTabWithTransition (HomeTBC,
                                TTabTransition.Slide,
                                TTabTransitionDirection.Normal);
       //                        , Nil);

end;

procedure TClinicPlusForm.LoadCliente(const AToken:String);
var
  FotoStream: TMemoryStream;
  BrushBMP: TBrushBitmap;
begin
    GetCliente ( AToken );

    nameLBL.Text := ClienteMTB.FieldByName('nome').AsString;
    cpfLBL.Text := ClienteMTB.FieldByName('cpf').AsString;

    FotoStream := TMemoryStream.Create;
    BrushBMP := TBrushBitmap.Create;
    try
      TBlobField(ClienteMTB.FieldByName('foto')) .SaveToStream (FotoStream) ;
      BrushBMP.Bitmap.LoadFromStream(FotoStream);
      BrushBMP.WrapMode := TWrapMode.TileStretch;
      Circle1.Fill.Bitmap.Assign (BrushBMP);
    finally
              FotoStream.Free;
              BrushBMP.Free;
    end;

end;

procedure TClinicPlusForm.Login(const ID, CPF: String);
var
 JSON: TJSONobject;
 Resposta: IResponse;
begin
       JSON:= TJSONObject.Create;
       try
         //cria json com informacoes para requisição
         JSON.AddPair('idcliente', ID);
         JSON.AddPair('cpf',cpf);
         try
           Resposta :=TRequest.New
           .BaseURL(EnderecoServidor+'token')
           .AddBody(JSON, False)
           .Accept('application/json')
           .Post;
         if Resposta.StatusCode =200 then begin
         // ShowMessage('Sucesso: '+Resposta.Content);
         Token:= 'Bearer' +Resposta.Content;
         end
         else begin
           ShowMessage('Falha na autenticação: '+Resposta.Content);
           end;
         except
           On E:Exception do begin
             ShowMessage ('Falha no login:' +E.Message);
           end;
           end;
         finally
              JSON.Free;

       end;
end;

procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
  var
  JSON: TJSONObject;
begin
    if AObject.Name.ToLower = 'confirmabutton' then
    begin
      AgendamentoMTB.Edit;
      AgendamentoMTBfg_status.AsString := 'C';
      AgendamentoMTBdata_confirmacao.Value :=Now;
      AgendamentoMTB.Post;
      JSON := AgendamentoMTB.ToJSONObject();
      ChangeSchedule (AgendamentoMTBidagendamento.Value, JSON);
      JSON.Free;

    end;
    if AObject.Name.ToLower = 'cancelabutton' then
    begin
      AgendamentoMTB.Edit;
      AgendamentoMTBfg_status.AsString := 'I';
      AgendamentoMTBdata_confirmacao.Value :=Now;
      AgendamentoMTB.Post;
      JSON := AgendamentoMTB.ToJSONObject();
      ChangeSchedule (AgendamentoMTBidagendamento.Value, JSON);
      JSON.Free;
    end;

    TTask.Run(procedure
    begin
      Sleep(200);
      AgendamentoMTB.EmptyDataSet;
      HistoricoMTB.EmptyDataSet;
      GetAgendamento(Token);
      GetHistorico(Token);
    end);
end;

procedure TClinicPlusForm.ScheduleLYTClick(Sender: TObject);
begin
Tanimator
   .AnimateFloat  (AnimeRct,
                   'Position.X',
                   ScheduleLYT.Position.X,
                   0.5,
                   TanimationType.Out,
                   TInterpolationType.Bounce);

   ContentTBC
   .SetActiveTabWithTransition( ScheduleTBC,
                                TTabTransition.Slide,
                                TTabTransitionDirection.Reversed);
     //                           , Nil);
end;

end.

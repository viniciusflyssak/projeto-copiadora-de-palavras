unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    mmoPalavrasCopiadas: TMemo;
    edtPalavra: TEdit;
    lblPalavra: TLabel;
    lblQtde: TLabel;
    edtQtde: TMaskEdit;
    btnIniciar: TSpeedButton;
    chkLinha: TCheckBox;
    chkMostrarNumero: TCheckBox;
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnIniciarClick(Sender: TObject);
var
  i: Integer;
  textoAgrupado: String;
  palavra: String;
  procedure setaReadOnly(status: Boolean);
  begin
    edtQtde.ReadOnly := status;
    mmoPalavrasCopiadas.ReadOnly := status;
    edtPalavra.ReadOnly:= status;
    btnIniciar.Enabled := not(status);
  end;
begin
  mmoPalavrasCopiadas.Clear;
  setaReadOnly(true);
  try
    textoAgrupado := '';
    for i := 1 to StrToInt(edtQtde.Text) do
    begin
      palavra := edtPalavra.Text;
      if chkMostrarNumero.Checked then
        palavra := IntToStr(i) + ': ' + palavra;
      if chkLinha.Checked then
        textoAgrupado := textoAgrupado + #10#13 + palavra + #10#13
      else
        textoAgrupado := textoAgrupado + ' ' + palavra;
    end;
    mmoPalavrasCopiadas.Text := textoAgrupado;
  finally
    setaReadOnly(false);
  end;
end;

end.

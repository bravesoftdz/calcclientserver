// 
// Created by the DataSnap proxy generator.
// 27.09.2013 13:42:59
// 

unit MyDSClient;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TMyClassClient = class(TDSAdminClient)
  private
    FSumCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Sum(a: Double; b: Double): Double;
  end;

implementation

function TMyClassClient.Sum(a: Double; b: Double): Double;
begin
  if FSumCommand = nil then
  begin
    FSumCommand := FDBXConnection.CreateCommand;
    FSumCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSumCommand.Text := 'TMyClass.Sum';
    FSumCommand.Prepare;
  end;
  FSumCommand.Parameters[0].Value.SetDouble(a);
  FSumCommand.Parameters[1].Value.SetDouble(b);
  FSumCommand.ExecuteUpdate;
  Result := FSumCommand.Parameters[2].Value.GetDouble;
end;


constructor TMyClassClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TMyClassClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TMyClassClient.Destroy;
begin
  FSumCommand.DisposeOf;
  inherited;
end;

end.

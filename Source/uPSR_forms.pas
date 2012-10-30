
unit UPSR_forms;

{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTCONTROLSCROLLBAR(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTSCROLLINGWINCONTROL(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTSCROLLBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFORM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTAPPLICATION(Cl: TPSRuntimeClassImporter);

procedure RIRegister_Forms(Cl: TPSRuntimeClassImporter);

implementation
uses
  sysutils, classes, {$IFDEF CLX}QControls, QForms, QGraphics{$ELSE}Controls, Forms, Graphics{$ENDIF};

procedure TCONTROLSCROLLBARKIND_R(Self: TCONTROLSCROLLBAR; var T: TSCROLLBARKIND); begin T := Self.KIND; end;
procedure TCONTROLSCROLLBARSCROLLPOS_R(Self: TCONTROLSCROLLBAR; var T: INTEGER); begin t := Self.SCROLLPOS; end;

procedure RIRegisterTCONTROLSCROLLBAR(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCONTROLSCROLLBAR) do
  begin
    RegisterPropertyHelper(@TCONTROLSCROLLBARKIND_R, nil, 'KIND');
    RegisterPropertyHelper(@TCONTROLSCROLLBARSCROLLPOS_R, nil, 'SCROLLPOS');
  end;
end;

procedure RIRegisterTSCROLLINGWINCONTROL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSCROLLINGWINCONTROL) do
  begin
    RegisterMethod(@TSCROLLINGWINCONTROL.SCROLLINVIEW, 'SCROLLINVIEW');
  end;
end;

procedure RIRegisterTSCROLLBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TSCROLLBOX);
end;
{$IFNDEF CLX}
procedure TFORMACTIVEOLECONTROL_W(Self: TFORM; T: TWINCONTROL); begin Self.ACTIVEOLECONTROL := T; end;
procedure TFORMACTIVEOLECONTROL_R(Self: TFORM; var T: TWINCONTROL); begin T := Self.ACTIVEOLECONTROL; end;
{$ENDIF}
procedure TFORMDROPTARGET_W(Self: TFORM; T: BOOLEAN); begin Self.DROPTARGET := T; end;
procedure TFORMDROPTARGET_R(Self: TFORM; var T: BOOLEAN); begin T := Self.DROPTARGET; end;
procedure TFORMMODALRESULT_W(Self: TFORM; T: TMODALRESULT); begin Self.MODALRESULT := T; end;
procedure TFORMMODALRESULT_R(Self: TFORM; var T: TMODALRESULT); begin T := Self.MODALRESULT; end;
{$IFNDEF CLX}
procedure TFORMTILEMODE_W(Self: TFORM; T: TTILEMODE); begin Self.TILEMODE := T; end;
procedure TFORMTILEMODE_R(Self: TFORM; var T: TTILEMODE); begin T := Self.TILEMODE; end;
{$ENDIF}

procedure TFORMACTIVE_R(Self: TFORM; var T: BOOLEAN); begin T := Self.ACTIVE; end;
procedure TFORMACTIVEMDICHILD_R(Self: TFORM; var T: TFORM); begin T := Self.ACTIVEMDICHILD; end;
procedure TFORMCANVAS_R(Self: TFORM; var T: TCANVAS); begin T := Self.CANVAS; end;
{$IFNDEF CLX}
procedure TFORMCLIENTHANDLE_R(Self: TFORM; var T: Longint); begin T := Self.CLIENTHANDLE; end;
{$ENDIF}
procedure TFORMMDICHILDCOUNT_R(Self: TFORM; var T: INTEGER); begin T := Self.MDICHILDCOUNT; end;
procedure TFORMMDICHILDREN_R(Self: TFORM; var T: TFORM; t1: INTEGER); begin T := Self.MDICHILDREN[T1]; end;
{ Innerfuse Pascal Script Class Import Utility (runtime) }

procedure RIRegisterTFORM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFORM) do
  begin
    {$IFDEF DELPHI4UP}
    RegisterVirtualConstructor(@TFORM.CREATENEW, 'CREATENEW');
    {$ELSE}
    RegisterConstructor(@TFORM.CREATENEW, 'CREATENEW');
    {$ENDIF}
    RegisterMethod(@TFORM.CLOSE, 'CLOSE');
    RegisterMethod(@TFORM.HIDE, 'HIDE');
    RegisterMethod(@TFORM.SHOW, 'SHOW');
    RegisterMethod(@TFORM.SHOWMODAL, 'SHOWMODAL');
    RegisterMethod(@TFORM.RELEASE, 'RELEASE');
    RegisterPropertyHelper(@TFORMACTIVE_R, nil, 'ACTIVE');

    {$IFNDEF PS_MINIVCL}
{$IFNDEF CLX}
    RegisterMethod(@TFORM.ARRANGEICONS, 'ARRANGEICONS');
    RegisterMethod(@TFORM.GETFORMIMAGE, 'GETFORMIMAGE');
    RegisterMethod(@TFORM.PRINT, 'PRINT');
    RegisterMethod(@TFORM.SENDCANCELMODE, 'SENDCANCELMODE');
    RegisterPropertyHelper(@TFORMACTIVEOLECONTROL_R, @TFORMACTIVEOLECONTROL_W, 'ACTIVEOLECONTROL');
    RegisterPropertyHelper(@TFORMCLIENTHANDLE_R, nil, 'CLIENTHANDLE');
    RegisterPropertyHelper(@TFORMTILEMODE_R, @TFORMTILEMODE_W, 'TILEMODE');
{$ENDIF}
    RegisterMethod(@TFORM.CASCADE, 'CASCADE');
    RegisterMethod(@TFORM.CLOSEQUERY, 'CLOSEQUERY');
    RegisterMethod(@TFORM.DEFOCUSCONTROL, 'DEFOCUSCONTROL');
    RegisterMethod(@TFORM.FOCUSCONTROL, 'FOCUSCONTROL');
    RegisterMethod(@TFORM.NEXT, 'NEXT');
    RegisterMethod(@TFORM.PREVIOUS, 'PREVIOUS');
    RegisterMethod(@TFORM.SETFOCUSEDCONTROL, 'SETFOCUSEDCONTROL');
    RegisterMethod(@TFORM.TILE, 'TILE');
    RegisterPropertyHelper(@TFORMACTIVEMDICHILD_R, nil, 'ACTIVEMDICHILD');
    RegisterPropertyHelper(@TFORMCANVAS_R, nil, 'CANVAS');
    RegisterPropertyHelper(@TFORMDROPTARGET_R, @TFORMDROPTARGET_W, 'DROPTARGET');
    RegisterPropertyHelper(@TFORMMODALRESULT_R, @TFORMMODALRESULT_W, 'MODALRESULT');
    RegisterPropertyHelper(@TFORMMDICHILDCOUNT_R, nil, 'MDICHILDCOUNT');
    RegisterPropertyHelper(@TFORMMDICHILDREN_R, nil, 'MDICHILDREN');
    {$ENDIF}
  end;
end;

procedure TAPPLICATIONACTIVE_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.ACTIVE; end;
{$IFNDEF CLX}
procedure TAPPLICATIONDIALOGHANDLE_R(Self: TAPPLICATION; var T: Longint); begin T := Self.DIALOGHANDLE; end;
procedure TAPPLICATIONDIALOGHANDLE_W(Self: TAPPLICATION; T: Longint); begin Self.DIALOGHANDLE := T; end;
procedure TAPPLICATIONHANDLE_R(Self: TAPPLICATION; var T: Longint); begin T := Self.HANDLE; end;
procedure TAPPLICATIONHANDLE_W(Self: TAPPLICATION; T: Longint); begin Self.HANDLE := T; end;
procedure TAPPLICATIONUPDATEFORMATSETTINGS_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.UPDATEFORMATSETTINGS; end;
procedure TAPPLICATIONUPDATEFORMATSETTINGS_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.UPDATEFORMATSETTINGS := T; end;
{$ENDIF}
procedure TAPPLICATIONEXENAME_R(Self: TAPPLICATION; var T: STRING); begin T := Self.EXENAME; end;
procedure TAPPLICATIONHELPFILE_R(Self: TAPPLICATION; var T: STRING); begin T := Self.HELPFILE; end;
procedure TAPPLICATIONHELPFILE_W(Self: TAPPLICATION; T: STRING); begin Self.HELPFILE := T; end;
procedure TAPPLICATIONHINT_R(Self: TAPPLICATION; var T: STRING); begin T := Self.HINT; end;
procedure TAPPLICATIONHINT_W(Self: TAPPLICATION; T: STRING); begin Self.HINT := T; end;
procedure TAPPLICATIONHINTCOLOR_R(Self: TAPPLICATION; var T: TCOLOR); begin T := Self.HINTCOLOR; end;
procedure TAPPLICATIONHINTCOLOR_W(Self: TAPPLICATION; T: TCOLOR); begin Self.HINTCOLOR := T; end;
procedure TAPPLICATIONHINTPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTPAUSE; end;
procedure TAPPLICATIONHINTPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTPAUSE := T; end;
procedure TAPPLICATIONHINTSHORTPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTSHORTPAUSE; end;
procedure TAPPLICATIONHINTSHORTPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTSHORTPAUSE := T; end;
procedure TAPPLICATIONHINTHIDEPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTHIDEPAUSE; end;
procedure TAPPLICATIONHINTHIDEPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTHIDEPAUSE := T; end;
procedure TAPPLICATIONMAINFORM_R(Self: TAPPLICATION; var T: {$IFDEF DELPHI3UP}TCustomForm{$ELSE}TFORM{$ENDIF}); begin T := Self.MAINFORM; end;
procedure TAPPLICATIONSHOWHINT_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.SHOWHINT; end;
procedure TAPPLICATIONSHOWHINT_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.SHOWHINT := T; end;
procedure TAPPLICATIONSHOWMAINFORM_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.SHOWMAINFORM; end;
procedure TAPPLICATIONSHOWMAINFORM_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.SHOWMAINFORM := T; end;
procedure TAPPLICATIONTERMINATED_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.TERMINATED; end;
procedure TAPPLICATIONTITLE_R(Self: TAPPLICATION; var T: STRING); begin T := Self.TITLE; end;
procedure TAPPLICATIONTITLE_W(Self: TAPPLICATION; T: STRING); begin Self.TITLE := T; end;
procedure TAPPLICATIONONACTIVATE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONACTIVATE; end;
procedure TAPPLICATIONONACTIVATE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONACTIVATE := T; end;
procedure TAPPLICATIONONDEACTIVATE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONDEACTIVATE; end;
procedure TAPPLICATIONONDEACTIVATE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONDEACTIVATE := T; end;
procedure TAPPLICATIONONIDLE_R(Self: TAPPLICATION; var T: TIDLEEVENT); begin T := Self.ONIDLE; end;
procedure TAPPLICATIONONIDLE_W(Self: TAPPLICATION; T: TIDLEEVENT); begin Self.ONIDLE := T; end;
procedure TAPPLICATIONONHELP_R(Self: TAPPLICATION; var T: THELPEVENT); begin T := Self.ONHELP; end;
procedure TAPPLICATIONONHELP_W(Self: TAPPLICATION; T: THELPEVENT); begin Self.ONHELP := T; end;
procedure TAPPLICATIONONHINT_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONHINT; end;
procedure TAPPLICATIONONHINT_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONHINT := T; end;
procedure TAPPLICATIONONMINIMIZE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONMINIMIZE; end;
procedure TAPPLICATIONONMINIMIZE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONMINIMIZE := T; end;
procedure TAPPLICATIONONRESTORE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONRESTORE; end;
procedure TAPPLICATIONONRESTORE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONRESTORE := T; end;

procedure RIRegisterTAPPLICATION(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TAPPLICATION) do
  begin
    RegisterMethod(@TAPPLICATION.BRINGTOFRONT, 'BRINGTOFRONT');
    RegisterMethod(@TAPPLICATION.MESSAGEBOX, 'MESSAGEBOX');
    RegisterMethod(@TAPPLICATION.MINIMIZE, 'MINIMIZE');
    RegisterMethod(@TAPPLICATION.PROCESSMESSAGES, 'PROCESSMESSAGES');
    RegisterMethod(@TAPPLICATION.RESTORE, 'RESTORE');
    RegisterMethod(@TAPPLICATION.TERMINATE, 'TERMINATE');
    RegisterPropertyHelper(@TAPPLICATIONACTIVE_R, nil, 'ACTIVE');
    RegisterPropertyHelper(@TAPPLICATIONEXENAME_R, nil, 'EXENAME');
    {$IFNDEF CLX}
    RegisterPropertyHelper(@TAPPLICATIONHANDLE_R, @TAPPLICATIONHANDLE_W, 'HANDLE');
    RegisterPropertyHelper(@TAPPLICATIONUPDATEFORMATSETTINGS_R, @TAPPLICATIONUPDATEFORMATSETTINGS_W, 'UPDATEFORMATSETTINGS');
    {$ENDIF}
    RegisterPropertyHelper(@TAPPLICATIONHINT_R, @TAPPLICATIONHINT_W, 'HINT');
    RegisterPropertyHelper(@TAPPLICATIONMAINFORM_R, nil, 'MAINFORM');
    RegisterPropertyHelper(@TAPPLICATIONSHOWHINT_R, @TAPPLICATIONSHOWHINT_W, 'SHOWHINT');
    RegisterPropertyHelper(@TAPPLICATIONSHOWMAINFORM_R, @TAPPLICATIONSHOWMAINFORM_W, 'SHOWMAINFORM');
    RegisterPropertyHelper(@TAPPLICATIONTERMINATED_R, nil, 'TERMINATED');
    RegisterPropertyHelper(@TAPPLICATIONTITLE_R, @TAPPLICATIONTITLE_W, 'TITLE');
    RegisterPropertyHelper(@TAPPLICATIONONACTIVATE_R, @TAPPLICATIONONACTIVATE_W, 'ONACTIVATE');
    RegisterPropertyHelper(@TAPPLICATIONONDEACTIVATE_R, @TAPPLICATIONONDEACTIVATE_W, 'ONDEACTIVATE');
    RegisterPropertyHelper(@TAPPLICATIONONIDLE_R, @TAPPLICATIONONIDLE_W, 'ONIDLE');
    RegisterPropertyHelper(@TAPPLICATIONONHINT_R, @TAPPLICATIONONHINT_W, 'ONHINT');
    RegisterPropertyHelper(@TAPPLICATIONONMINIMIZE_R, @TAPPLICATIONONMINIMIZE_W, 'ONMINIMIZE');
    RegisterPropertyHelper(@TAPPLICATIONONRESTORE_R, @TAPPLICATIONONRESTORE_W, 'ONRESTORE');

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TAPPLICATION.CONTROLDESTROYED, 'CONTROLDESTROYED');
    RegisterMethod(@TAPPLICATION.CANCELHINT, 'CANCELHINT');
    {$IFNDEF CLX}
    RegisterPropertyHelper(@TAPPLICATIONDIALOGHANDLE_R, @TAPPLICATIONDIALOGHANDLE_W, 'DIALOGHANDLE');
    RegisterMethod(@TAPPLICATION.CREATEHANDLE, 'CREATEHANDLE');
    RegisterMethod(@TAPPLICATION.HELPCOMMAND, 'HELPCOMMAND');
    RegisterMethod(@TAPPLICATION.HELPCONTEXT, 'HELPCONTEXT');
    RegisterMethod(@TAPPLICATION.HELPJUMP, 'HELPJUMP');
//    RegisterMethod(@TAPPLICATION.HOOKMAINWINDOW, 'HOOKMAINWINDOW');
//    RegisterMethod(@TAPPLICATION.UNHOOKMAINWINDOW, 'UNHOOKMAINWINDOW');
    {$ENDIF}
    RegisterMethod(@TAPPLICATION.HANDLEEXCEPTION, 'HANDLEEXCEPTION');
    RegisterMethod(@TAPPLICATION.HANDLEMESSAGE, 'HANDLEMESSAGE');
    RegisterMethod(@TAPPLICATION.HIDEHINT, 'HIDEHINT');
    RegisterMethod(@TAPPLICATION.HINTMOUSEMESSAGE, 'HINTMOUSEMESSAGE');
    RegisterMethod(@TAPPLICATION.INITIALIZE, 'INITIALIZE');
    RegisterMethod(@TAPPLICATION.NORMALIZETOPMOSTS, 'NORMALIZETOPMOSTS');
    RegisterMethod(@TAPPLICATION.RESTORETOPMOSTS, 'RESTORETOPMOSTS');
    RegisterMethod(@TAPPLICATION.RUN, 'RUN');
//    RegisterMethod(@TAPPLICATION.SHOWEXCEPTION, 'SHOWEXCEPTION');
    RegisterPropertyHelper(@TAPPLICATIONHELPFILE_R, @TAPPLICATIONHELPFILE_W, 'HELPFILE');
    RegisterPropertyHelper(@TAPPLICATIONHINTCOLOR_R, @TAPPLICATIONHINTCOLOR_W, 'HINTCOLOR');
    RegisterPropertyHelper(@TAPPLICATIONHINTPAUSE_R, @TAPPLICATIONHINTPAUSE_W, 'HINTPAUSE');
    RegisterPropertyHelper(@TAPPLICATIONHINTSHORTPAUSE_R, @TAPPLICATIONHINTSHORTPAUSE_W, 'HINTSHORTPAUSE');
    RegisterPropertyHelper(@TAPPLICATIONHINTHIDEPAUSE_R, @TAPPLICATIONHINTHIDEPAUSE_W, 'HINTHIDEPAUSE');
    RegisterPropertyHelper(@TAPPLICATIONONHELP_R, @TAPPLICATIONONHELP_W, 'ONHELP');
    {$ENDIF}
  end;
end;

procedure RIRegister_Forms(Cl: TPSRuntimeClassImporter);
begin
  {$IFNDEF PS_MINIVCL}
  RIRegisterTCONTROLSCROLLBAR(cl);
  RIRegisterTSCROLLBOX(cl);
  {$ENDIF}
  RIRegisterTScrollingWinControl(cl);
  RIRegisterTForm(Cl);
  {$IFNDEF PS_MINIVCL}
  RIRegisterTApplication(Cl);
  {$ENDIF}
end;


// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.






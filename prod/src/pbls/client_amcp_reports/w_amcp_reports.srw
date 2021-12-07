$PBExportHeader$w_amcp_reports.srw
forward
global type w_amcp_reports from w_client_sheet
end type
type tab_1 from u_tab_client within w_amcp_reports
end type
type tab_1 from u_tab_client within w_amcp_reports
end type
type st_report_list from statictext within w_amcp_reports
end type
type st_filter_businesssource_header from statictext within w_amcp_reports
end type
type dw_filter_businesssource from u_dw within w_amcp_reports
end type
type st_filter_businesssource_2 from statictext within w_amcp_reports
end type
type st_filter_businesssource_1 from statictext within w_amcp_reports
end type
type st_report_criteria from statictext within w_amcp_reports
end type
type dw_report_list from u_dw within w_amcp_reports
end type
type dw_report_criteria from u_dw within w_amcp_reports
end type
type st_report_view from statictext within w_amcp_reports
end type
type dw_report_view from u_dw within w_amcp_reports
end type
type st_report_view_header from statictext within w_amcp_reports
end type
type dw_filter_acctmanager from u_dw within w_amcp_reports
end type
type dw_filter_acctmanager_amcpreportgroup from u_dw within w_amcp_reports
end type
type st_filter_acctmanager_1 from statictext within w_amcp_reports
end type
type st_filter_acctmanager_2 from statictext within w_amcp_reports
end type
type st_filter_acctmgrrpt_classification from statictext within w_amcp_reports
end type
type st_filter_acctmanager_amcpreportgroup from statictext within w_amcp_reports
end type
type st_filter_acctmanager_header from statictext within w_amcp_reports
end type
type dw_filter_acctmgrrpt_classification from u_dw within w_amcp_reports
end type
end forward

global type w_amcp_reports from w_client_sheet
integer width = 3685
integer height = 2016
string title = "AMCP Reports"
string menuname = "m_report_amcp"
boolean resizable = true
event type integer ue_createtemptable ( string as_tablename,  string as_sql )
event type integer ue_droptemptable ( )
event ue_clearcriteria ( )
tab_1 tab_1
st_report_list st_report_list
st_filter_businesssource_header st_filter_businesssource_header
dw_filter_businesssource dw_filter_businesssource
st_filter_businesssource_2 st_filter_businesssource_2
st_filter_businesssource_1 st_filter_businesssource_1
st_report_criteria st_report_criteria
dw_report_list dw_report_list
dw_report_criteria dw_report_criteria
st_report_view st_report_view
dw_report_view dw_report_view
st_report_view_header st_report_view_header
dw_filter_acctmanager dw_filter_acctmanager
dw_filter_acctmanager_amcpreportgroup dw_filter_acctmanager_amcpreportgroup
st_filter_acctmanager_1 st_filter_acctmanager_1
st_filter_acctmanager_2 st_filter_acctmanager_2
st_filter_acctmgrrpt_classification st_filter_acctmgrrpt_classification
st_filter_acctmanager_amcpreportgroup st_filter_acctmanager_amcpreportgroup
st_filter_acctmanager_header st_filter_acctmanager_header
dw_filter_acctmgrrpt_classification dw_filter_acctmgrrpt_classification
end type
global w_amcp_reports w_amcp_reports

type variables
// Keep track of temporary tables.
string is_temptable[]

// Reference the transaction object to be used for reporting
n_tr itr_report

// Save criteria when a report run is requested.
datetime idt_periodend

integer ii_quarteryear[]
integer ii_quartermonth[]
integer ii_quarteryearbcsend[]
integer ii_quartermonthbcsend[]
integer ii_quarteryearbcsstart[]
integer ii_quartermonthbcsstart[]
integer ii_startyear
integer ii_startmonth
integer ii_startyearbcs
integer ii_startmonthbcs
integer ii_averagebcs
integer ii_averagebcsmonths
integer ii_avgbcsoption

long	il_classidnum
long	il_persidnum

string is_reportingperiod
string is_reportversion

string is_amcpreportgroup_dragicon
string is_acctmanager_dragicon
end variables

event ue_createtemptable;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Create a temporary table.  Save the table name so we
//						are sure to drop it when we close.
//
//	Arguments:		as_tablename	Name of temporary table.  Used in ue_droptemptable.
//						as_sql			SQL to be used in creating the table.
//
//	Returns:			1	Success
//						-1	Failure
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//
//////////////////////////////////////////////////////////////////////////////

int li_idx

li_idx = UpperBound ( This.is_temptable ) + 1
This.is_temptable[li_idx] = as_tablename

This.itr_report.of_execute ( as_sql )
IF	This.itr_report.of_checkreturn ( This.Title &
	+ ' ue_createtemptable: Create Table ~r~n' + as_sql ) < 0 THEN
	This.itr_report.of_display_error ()
	Return -1
END IF

Return 1

end event

event ue_droptemptable;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drop all temporary tables before closing this window.
//
//	Arguments:		None
//
//	Returns:			1	Success
//						-1	Failure
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//
//////////////////////////////////////////////////////////////////////////////

int li_idx
int li_max
string ls_sql

li_max = UpperBound ( This.is_temptable )
IF	li_max < 1 THEN
	Return 1
END IF

ls_sql = 'drop table '

FOR li_idx = 1 TO li_max
	
	// Avoid errors by skipping tables that are already dropped.
	IF	This.is_temptable[li_idx] = '' THEN
		CONTINUE
	END IF
	
	This.itr_report.of_execute ( ls_sql + This.is_temptable[li_idx] )
	IF	This.itr_report.of_checkreturn ( This.Title + ' ue_droptemptable: Drop Table ' &
	+ This.is_temptable[li_idx] ) < 0 THEN
		This.itr_report.of_display_error ()
		Return -1
	ELSE
		// Be sure we do not do this twice.
		This.is_temptable[li_idx] = ''
	END IF
	
NEXT

Return 1
end event

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description: Trigger the datawindow control event.
//						
//
//	Arguments:  none
//
//	Returns:  none
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

dw_report_criteria.Reset ()
dw_report_list.SelectRow ( 0, False )
end event

on w_amcp_reports.create
int iCurrent
call super::create
if this.MenuName = "m_report_amcp" then this.MenuID = create m_report_amcp
this.tab_1=create tab_1
this.st_report_list=create st_report_list
this.st_filter_businesssource_header=create st_filter_businesssource_header
this.dw_filter_businesssource=create dw_filter_businesssource
this.st_filter_businesssource_2=create st_filter_businesssource_2
this.st_filter_businesssource_1=create st_filter_businesssource_1
this.st_report_criteria=create st_report_criteria
this.dw_report_list=create dw_report_list
this.dw_report_criteria=create dw_report_criteria
this.st_report_view=create st_report_view
this.dw_report_view=create dw_report_view
this.st_report_view_header=create st_report_view_header
this.dw_filter_acctmanager=create dw_filter_acctmanager
this.dw_filter_acctmanager_amcpreportgroup=create dw_filter_acctmanager_amcpreportgroup
this.st_filter_acctmanager_1=create st_filter_acctmanager_1
this.st_filter_acctmanager_2=create st_filter_acctmanager_2
this.st_filter_acctmgrrpt_classification=create st_filter_acctmgrrpt_classification
this.st_filter_acctmanager_amcpreportgroup=create st_filter_acctmanager_amcpreportgroup
this.st_filter_acctmanager_header=create st_filter_acctmanager_header
this.dw_filter_acctmgrrpt_classification=create dw_filter_acctmgrrpt_classification
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_report_list
this.Control[iCurrent+3]=this.st_filter_businesssource_header
this.Control[iCurrent+4]=this.dw_filter_businesssource
this.Control[iCurrent+5]=this.st_filter_businesssource_2
this.Control[iCurrent+6]=this.st_filter_businesssource_1
this.Control[iCurrent+7]=this.st_report_criteria
this.Control[iCurrent+8]=this.dw_report_list
this.Control[iCurrent+9]=this.dw_report_criteria
this.Control[iCurrent+10]=this.st_report_view
this.Control[iCurrent+11]=this.dw_report_view
this.Control[iCurrent+12]=this.st_report_view_header
this.Control[iCurrent+13]=this.dw_filter_acctmanager
this.Control[iCurrent+14]=this.dw_filter_acctmanager_amcpreportgroup
this.Control[iCurrent+15]=this.st_filter_acctmanager_1
this.Control[iCurrent+16]=this.st_filter_acctmanager_2
this.Control[iCurrent+17]=this.st_filter_acctmgrrpt_classification
this.Control[iCurrent+18]=this.st_filter_acctmanager_amcpreportgroup
this.Control[iCurrent+19]=this.st_filter_acctmanager_header
this.Control[iCurrent+20]=this.dw_filter_acctmgrrpt_classification
end on

on w_amcp_reports.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_1)
destroy(this.st_report_list)
destroy(this.st_filter_businesssource_header)
destroy(this.dw_filter_businesssource)
destroy(this.st_filter_businesssource_2)
destroy(this.st_filter_businesssource_1)
destroy(this.st_report_criteria)
destroy(this.dw_report_list)
destroy(this.dw_report_criteria)
destroy(this.st_report_view)
destroy(this.dw_report_view)
destroy(this.st_report_view_header)
destroy(this.dw_filter_acctmanager)
destroy(this.dw_filter_acctmanager_amcpreportgroup)
destroy(this.st_filter_acctmanager_1)
destroy(this.st_filter_acctmanager_2)
destroy(this.st_filter_acctmgrrpt_classification)
destroy(this.st_filter_acctmanager_amcpreportgroup)
destroy(this.st_filter_acctmanager_header)
destroy(this.dw_filter_acctmgrrpt_classification)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Set up tab pages for AMCP Reporting view.
//						Identify the transaction object to be used for reports.
//
//		Rules:		Only AMCP users may view this window.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

string ls_databasename
string ls_servername

// Disable the AMCP menu unless this is an AMCP user.
m_client lm_client
IF	gnv_app.ib_amcp_update THEN
ELSE
	lm_client = This.MenuID
	lm_client.m_amcp.visible = False
END IF

tab_1.Event ue_settabcontrol ()

// We need to get connection parameters from the database.
// We need server and database names.
// We will use the same user logon.
IF	IsValid ( gnv_app.ids_work ) THEN
ELSE
	gnv_app.ids_work = Create n_ds
END IF
gnv_app.ids_work.dataobject = 'd_amcp_reports_database_connection'
gnv_app.ids_work.of_SetTransObject ( SQLCA )
IF	gnv_app.ids_work.Retrieve ( 'AMCPReportDB' ) = 1 THEN
	// Use the CCRControl row to determine the database connection.
	// If we are pointing to the SQLCA database and server, just use
	// SQLCA.
	ls_servername 		= gnv_app.ids_work.GetItemString ( 1, 'ColumnDescription' )
	ls_databasename 	= gnv_app.ids_work.GetItemString ( 1, 'ColumnValue' )
	IF	Lower ( ls_servername ) = Lower ( SQLCA.ServerName ) &
	AND Lower ( ls_databasename ) = Lower ( SQLCA.Database ) THEN
		// Just use SQLCA.
		gnv_app.itr_amcp_reports = SQLCA
		This.itr_report = gnv_app.itr_amcp_reports
	ELSE
		// We need a new transaction object.
		// Copy all of the values from SQLCA except server and database.
		IF	IsValid ( gnv_app.itr_amcp_reports ) THEN
		ELSE
			gnv_app.itr_amcp_reports = Create n_tr
		END IF
		gnv_app.itr_amcp_reports.DBMS 		= SQLCA.DBMS 
		gnv_app.itr_amcp_reports.Database 	= ls_databasename
		gnv_app.itr_amcp_reports.ServerName = ls_servername
		// We have to connect to be useful.
		gnv_app.itr_amcp_reports.of_setuser ( SQLCA.Logid, SQLCA.LogPass )
		gnv_app.itr_amcp_reports.of_Connect ()
		IF	gnv_app.itr_amcp_reports.of_CheckReturn ( &
			This.Title + &
				'pfc_postopen: Connection to CCR Report Database Failed.~r~n' ) <> 0 THEN
			gnv_app.itr_amcp_reports.of_Display_Error ()			
			// On error, use SQLCA.
			gnv_app.itr_amcp_reports.of_disconnect () ;
			Destroy ( gnv_app.itr_amcp_reports )
			This.itr_report = SQLCA
		ELSE
			This.itr_report = gnv_app.itr_amcp_reports
		END IF		
	END IF		
ELSE
	// Use SQLCA.
	This.itr_report = SQLCA
END IF

// Now set the transaction SQLCA ONLY for datawindows that update data.
dw_filter_acctmanager.of_SetTransObject ( SQLCA )
dw_filter_acctmgrrpt_classification.of_SetTransObject ( SQLCA )
dw_filter_acctmanager_amcpreportgroup.of_SetTransObject ( SQLCA )
dw_filter_businesssource.of_SetTransObject ( SQLCA )

// Note:  We cannot set the transaction This.itr_report for the dw_report_view until
// we actually have selected a report datawindow object.

// Set up the resize capability.
// Removed because it conflicts with the wiretab somehow.
//This.of_setresize ( True )
//This.inv_resize.of_register ( dw_filter_businesssource, 'ScaleToRight&Bottom' )
//This.inv_resize.of_register ( dw_filter_acctmanager, 'FixedToRight&ScaleToBottom' )
//This.inv_resize.of_register ( dw_filter_acctmanager_classification, 'FixedToRight&ScaleToBottom' )
//This.inv_resize.of_register ( dw_report_list, 'FixedToRight&ScaleToBottom' )
//This.inv_resize.of_register ( dw_report_view, 'ScaleToRight&Bottom' )
//This.inv_resize.of_register ( tab_1, 'ScaleToRight&Bottom' )



end event

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Decide whether or not to disconnect / destroy the
//						report transaction object.  We need to be careful 
//						so that we do NOT disconnect or destroy SQLCA.
//
//						See pfc_preopen for background information.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

IF	gnv_app.itr_amcp_reports.Database 	= SQLCA.Database &
AND gnv_app.itr_amcp_reports.ServerName = SQLCA.ServerName THEN
	// Do NOT disconnect or destroy gnv_app.itr_amcp_reports.
	// It is pointing to SQLCA.
ELSE
	IF ISVALID(gnv_app.itr_amcp_reports) THEN
	   DISCONNECT USING gnv_app.itr_amcp_reports ;
	   Destroy ( gnv_app.itr_amcp_reports )
   END IF
END IF
end event

type tab_1 from u_tab_client within w_amcp_reports
integer x = 27
integer y = 16
integer width = 3611
integer height = 1800
integer taborder = 20
end type

event ue_settabcontrol;///////////////////////////////////////////////////////////////////////
//
// Description:	Set up objects to be visible for each tab page.
//
//
////////////////////////////////////////////////////////////////////////

integer li_idx
integer li_max
string ls_tabs[]
graphicobject lgo_tabs[]
graphicobject lgo_null[]

// Start by making everything invisible.
li_max = UpperBound ( Parent.Control )
FOR li_idx = 1 to li_max
	Parent.Control[li_idx].visible = False
NEXT
// Make the tab and the header dw visible.
tab_1.visible 	= True

ls_tabs[1]	= 'Filter Business Sources'
ls_tabs[2]	= 'Filter Account Managers'
ls_tabs[3]	= 'Select Report'
ls_tabs[4]	= 'View Selected Report'
This.of_createtabs ( ls_tabs )

lgo_tabs		= lgo_null
lgo_tabs[1] = dw_filter_businesssource
lgo_tabs[2] = st_filter_businesssource_1
lgo_tabs[3] = st_filter_businesssource_2
lgo_tabs[4] = st_filter_businesssource_header
This.of_wiretab ( 1, lgo_tabs )

lgo_tabs		= lgo_null
lgo_tabs[1] = dw_filter_acctmanager
lgo_tabs[2] = st_filter_acctmanager_1
lgo_tabs[3] = st_filter_acctmanager_2
lgo_tabs[4] = st_filter_acctmanager_header
IF	gnv_app.ib_amcp_update THEN
	lgo_tabs[5] = dw_filter_acctmanager_amcpreportgroup
	lgo_tabs[6] = dw_filter_acctmgrrpt_classification
	lgo_tabs[7] = st_filter_acctmgrrpt_classification
	lgo_tabs[8] = st_filter_acctmanager_amcpreportgroup
END IF
This.of_wiretab ( 2, lgo_tabs )

lgo_tabs		= lgo_null
lgo_tabs[1] = dw_report_criteria
lgo_tabs[2] = dw_report_list
lgo_tabs[3] = st_report_criteria
lgo_tabs[4] = st_report_list
This.of_wiretab ( 3, lgo_tabs )

lgo_tabs		= lgo_null
lgo_tabs[1] = dw_report_criteria
lgo_tabs[2] = dw_report_view
lgo_tabs[3] = st_report_view_header
lgo_tabs[4] = st_report_view
This.of_wiretab ( 4, lgo_tabs )

tab_1.SelectedTab = 1

Return 1
end event

event selectionchanging;////////////////////////////////////////////////////////////////////////////////
//
//	Description:		If we are leaving an updateable tab page, call save.
//
//	Returns:
//		Integer			1	Success
//							-1	Failure
//
////////////////////////////////////////////////////////////////////////////////
//
// Revisions:
//
////////////////////////////////////////////////////////////////////////////////

string ls_datawindowobject
string ls_startyearmonth

CHOOSE CASE oldindex
	CASE 1, 2
		// If save fails, do not allow the selection to change.
		IF	gnv_app.ib_amcp_update THEN
			IF	Parent.Event pfe_save () < 1 THEN
				Return 1
			END IF		
		END IF
	CASE ELSE
END CHOOSE

CHOOSE CASE newindex
	CASE 4
		// Edit the criteria before running the report.
		IF	dw_report_criteria.RowCount () > 0 THEN
			ls_datawindowobject = dw_report_criteria.GetItemString ( 1, 'datawindowobject' )
			IF	IsNull ( ls_startyearmonth ) THEN
				MessageBox ( 'AMCP Report Criteria', 'Selected report is not currently available.' )
				Return 1
			END IF
			IF	dw_filter_acctmanager.Event ue_howmanyrowsselected () > 1 THEN
				MessageBox ( 'Account Manager Filter', &
					'More than one Account Manager is selected. Please correct. ' )
				Return 1
			END IF
		ELSE
			MessageBox ( 'AMCP Report Criteria', 'Please select a report.' )
			Return 1
		END IF
	CASE ELSE
END CHOOSE

// Call the event to display/hide the appropriate controls.
This.of_setwiredobjectvisibility ( newindex )

Return 0
end event

event selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Trigger the event(s) to setup the new tab page.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

m_report_amcp lm_parent

lm_parent = Parent.MenuID

// Enable / disable menus.
CHOOSE CASE newindex
	CASE 1
		// Business Source selection.
		// We need the save menu.  But not print stuff.
		lm_parent.m_file.m_saveas.enabled 			= False
		lm_parent.m_file.m_print.enabled 			= False
		lm_parent.m_file.m_printpreview.enabled 	= False
		lm_parent.m_file.m_pagesetup.enabled 		= False
		IF	gnv_app.ib_amcp_update THEN
			lm_parent.m_edit.m_save.enabled 			= True
		ELSE
			lm_parent.m_edit.m_save.enabled 			= False
		END IF			
		lm_parent.m_edit.m_insertrow.enabled 		= False
		lm_parent.m_edit.m_delete.enabled 			= False
		lm_parent.m_view.m_clearcriteria.enabled 	= False
		lm_parent.m_view.m_sort.enabled			 	= False
		lm_parent.m_view.m_filter.enabled 			= False
		IF	dw_filter_businesssource.RowCount () < 1 THEN
			dw_filter_businesssource.Retrieve ()
		END IF
	CASE 2
		// Account Manager Selection.
		lm_parent.m_file.m_saveas.enabled 			= False
		lm_parent.m_file.m_print.enabled 			= False
		lm_parent.m_file.m_printpreview.enabled 	= False
		lm_parent.m_file.m_pagesetup.enabled 		= False
		IF	gnv_app.ib_amcp_update THEN
			lm_parent.m_edit.m_save.enabled 			= True
		ELSE
			lm_parent.m_edit.m_save.enabled 			= False
		END IF			
		lm_parent.m_edit.m_insertrow.enabled 		= False
		lm_parent.m_edit.m_delete.enabled 			= False
		lm_parent.m_view.m_clearcriteria.enabled 	= False
		lm_parent.m_view.m_sort.enabled			 	= True
		lm_parent.m_view.m_filter.enabled 			= True
		IF	dw_filter_acctmanager.RowCount () < 1 THEN
			dw_filter_acctmanager.Retrieve ()
			dw_filter_acctmanager.SelectRow ( 0, False )
		END IF
		
	CASE 3
		// Report Criteria Entry.
		lm_parent.m_file.m_saveas.enabled 			= False
		lm_parent.m_file.m_print.enabled 			= False
		lm_parent.m_file.m_printpreview.enabled 	= False
		lm_parent.m_file.m_pagesetup.enabled 		= False
		lm_parent.m_edit.m_save.enabled 				= False
		lm_parent.m_edit.m_insertrow.enabled 		= False
		lm_parent.m_edit.m_delete.enabled 			= False
		lm_parent.m_view.m_clearcriteria.enabled 	= True
		lm_parent.m_view.m_sort.enabled			 	= False
		lm_parent.m_view.m_filter.enabled 			= False
		
	CASE 4	
		// Report View.
		lm_parent.m_file.m_saveas.enabled 			= True
		lm_parent.m_file.m_print.enabled 			= True
		lm_parent.m_file.m_printpreview.enabled 	= True
		lm_parent.m_file.m_pagesetup.enabled 		= True
		lm_parent.m_edit.m_save.enabled 				= False
		lm_parent.m_edit.m_insertrow.enabled 		= False
		lm_parent.m_edit.m_delete.enabled 			= False
		lm_parent.m_view.m_clearcriteria.enabled 	= False
		lm_parent.m_view.m_sort.enabled			 	= True
		lm_parent.m_view.m_filter.enabled 			= True
		
		// We are going to run a report.  Let the datawindow do the work.
		dw_report_view.Event ue_runreport ()
		
END CHOOSE



end event

type st_report_list from statictext within w_amcp_reports
integer x = 91
integer y = 600
integer width = 3502
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a single Report on the List to view, print, or save as a spread sheet.  The View Report tab will enable.  Select it to run the report."
boolean focusrectangle = false
end type

type st_filter_businesssource_header from statictext within w_amcp_reports
integer x = 91
integer y = 300
integer width = 855
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Business Sources"
boolean focusrectangle = false
end type

type dw_filter_businesssource from u_dw within w_amcp_reports
integer x = 91
integer y = 364
integer width = 1664
integer height = 1428
integer taborder = 10
string dataobject = "d_amcp_reports_bussrc_selection_list"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Handle AMCP Update security.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

IF	gnv_app.ib_amcp_update THEN
	This.ib_isupdateable = True
ELSE
	This.ib_isupdateable = False
	This.object.amcprptexcluded.protect = '1'
END IF
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Allow single row selection.  
//						We are NOT using the service.  We want to user to be able
//						to deselect a row by clicking on it.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

IF	row < 1 THEN
	Return AncestorReturnValue
END IF

IF	This.IsSelected ( row ) THEN
	This.SelectRow ( row, False )
ELSE
	This.SelectRow ( 0, False )
	This.SelectRow ( row, True )
END IF

Return AncestorReturnValue 
end event

type st_filter_businesssource_2 from statictext within w_amcp_reports
integer x = 91
integer y = 200
integer width = 2985
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a row to run a report for a single Business Source.  Highlighted rows do not persist after the window is closed."
boolean focusrectangle = false
end type

type st_filter_businesssource_1 from statictext within w_amcp_reports
integer x = 91
integer y = 136
integer width = 3081
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check the Exclude checkbox to exclude the Business Source from the reports.  Selections persist until modified by the user."
boolean focusrectangle = false
end type

type st_report_criteria from statictext within w_amcp_reports
integer x = 91
integer y = 132
integer width = 1029
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter Report Criteria for Selected Report."
boolean focusrectangle = false
end type

type dw_report_list from u_dw within w_amcp_reports
integer x = 91
integer y = 672
integer width = 3040
integer height = 1064
integer taborder = 30
string dataobject = "d_amcp_reports_reportlist"
boolean hscrollbar = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Allow the user to select one and only one row.
//						Do not use the service.
//						If a row is selected, copy the row to the criteria display.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

IF row < 1 THEN
	Return AncestorReturnValue
END IF

IF	This.IsSelected ( row ) THEN
	This.SelectRow ( row, False )
	dw_report_criteria.Reset ()
ELSE
	This.SelectRow ( 0, False ) 
	This.SelectRow ( row, True )
	dw_report_criteria.Reset ()
	dw_report_criteria.InsertRow ( 0 )
	dw_report_criteria.SetItem ( 1, 'reportname', &
		This.GetItemString ( row, 'reportname' ) )
	dw_report_criteria.SetItem ( 1, 'reportversion', &
		This.GetItemString ( row, 'reportversion' ) )
	dw_report_criteria.SetItem ( 1, 'reportingperiod', &
		This.GetItemString ( row, 'reportingperiod' ) )
	dw_report_criteria.SetItem ( 1, 'datawindowobject', &
		This.GetItemString ( row, 'datawindowobject' ) )
END IF

Return AncestorReturnValue
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	We do not update.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002 New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

// Retrieve all reports for AMCP authorized users.
// Otherwise, only retrieve reports for regular CCR users.
IF	gnv_app.ib_amcp_update THEN
	This.Retrieve ( 1 )
ELSE
	This.Retrieve ( 0 )
END IF

end event

type dw_report_criteria from u_dw within w_amcp_reports
integer x = 91
integer y = 204
integer width = 3506
integer height = 296
integer taborder = 20
string dataobject = "d_amcp_reports_report_criteria"
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Control dates/average bcs user settings.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

integer li_averagebcs
integer li_month
integer li_year
string ls_startyearmonth
string ls_startyearmonthbcs

CHOOSE CASE dwo.name
//	AMCP	LANelson	01/01/2003 Start.	
//			We no longer allow the user to enter startyearmonthbcs.
//			For Average BCS, the number of trailing months is fixed at 1.
//			If Average BCS is NOT selected, the number of trailing months is zero
//			and startyearmonthbcs is the same as startyearmonth.
//												
	CASE 'averagebcs'
		// If we are not using Average BCS, then
		// reset the Average BCS Months and BCS Start Month.
		// If we are using Average BCS, then set the BCS Start Month to on
		// month prior.
		ls_startyearmonth = This.GetItemString ( row, 'startyearmonth' )
		CHOOSE CASE data
			CASE '1'
				IF	IsNull ( ls_startyearmonth ) &
				OR	Len ( Trim ( ls_startyearmonth ) ) < 1 THEN
					This.SetItem ( row, 'startyearmonthbcs', ls_startyearmonthbcs )
				ELSE	
					// Always default to 1 month prior.
					li_year 	= Integer ( Mid ( ls_startyearmonth, 1, 4 ) )
					li_month = Integer ( Mid ( ls_startyearmonth, 5 ) )
					IF	li_month = 1 THEN
						li_month = 12
						li_year = li_year - 1
					ELSE
						li_month = li_month - 1
					END IF
					ls_startyearmonthbcs = &
						String ( li_year ) + String ( li_month, '00' )
					This.SetItem ( row, 'startyearmonthbcs', ls_startyearmonthbcs )
				END IF
			CASE ELSE
				This.SetItem ( row, 'averagebcsmonths', 0 )
				This.SetItem ( row, 'startyearmonthbcs', ls_startyearmonth )
		END CHOOSE
	CASE 'averagebcsmonths'
		// If the average bcs months has changed, no action is required.
	CASE 'startyearmonthbcs'
		// BCS should be trailing.
		// BCS startyearmonthbcs cannot be modified by the user directly.
	CASE 'startyearmonth'
		// If average bcs is checked, BCS should be trailing.
		// If the number of trailing months is fixed at 1.
		// Otherwise BCS should be the same as the report start year month.
		li_averagebcs = This.GetItemNumber ( row, 'averagebcs' )
		IF	li_averagebcs = 1 THEN
			// Always default to 1 month prior.
			li_year 	= Integer ( Mid ( data, 1, 4 ) )
			li_month = Integer ( Mid ( data, 5 ) )
			IF	li_month = 1 THEN
				li_month = 12
				li_year = li_year - 1
			ELSE
				li_month = li_month - 1
			END IF
			ls_startyearmonthbcs = &
				String ( li_year ) + String ( li_month, '00' )
			This.SetItem ( row, 'startyearmonthbcs', ls_startyearmonthbcs )					
		ELSE
			This.SetItem ( row, 'startyearmonthbcs', data )
		END IF	
// AMCP 	LANelson 01/01/2003 End.

	CASE ELSE
END CHOOSE

Return AncestorReturnValue
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Set up data in the dropdown datawindows.  They are external.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

datawindowchild ldwc_startyearmonth
datawindowchild ldwc_startyearmonthbcs

integer li_idx
integer li_month
integer li_year

long ll_row

string ls_yearmonth

integer li_return

This.ib_isupdateable = False

// Set up the dropdown lists for the year/month selections.
li_return = This.GetChild ( 'startyearmonth', ldwc_startyearmonth )
ldwc_startyearmonth.Reset ()

li_return = This.GetChild ( 'startyearmonthbcs', ldwc_startyearmonthbcs )
ldwc_startyearmonthbcs.Reset ()

// Figure out the number of year/month combinations.
// We only have data for the prior months.
li_month = Month ( Today () )
li_year 	= Year ( Today  () )

// Loop thru the 36 months of history prior to the current year/month 
FOR li_idx = 1 TO 37
	
	ls_yearmonth = String ( li_year ) + String ( li_month, '00' )
	
	// Lead and loan history only loaded for 2002 Q4 onward.
	// However, we can let this be just in case.
	IF	li_year >= 2002 THEN
		ll_row = ldwc_startyearmonth.InsertRow ( 0 )
		ldwc_startyearmonth.SetItem ( ll_row, 'yearmonth', ls_yearmonth )
	END IF
	
	// BCS history only loaded for 2002 onward.
	IF	li_year >= 2002 THEN
		ll_row = ldwc_startyearmonthbcs.InsertRow ( 0 )
		ldwc_startyearmonthbcs.SetItem ( ll_row, 'yearmonth', ls_yearmonth )
	ELSE
		// We have no more historical data.
		EXIT
	END IF
	
	// Calculate next previous month.
	IF	li_month = 1 THEN
		li_year = li_year - 1
		li_month = 12
	ELSE
		li_month = li_month - 1
	END IF

NEXT





end event

event clicked;call super::clicked;IF IsValid ( dwo ) THEN
ELSE
	Return AncestorReturnValue
END IF

CHOOSE CASE dwo.name
	CASE 'b_viewreport'
	CASE ELSE
		Return AncestorReturnValue
END CHOOSE

IF	This.AcceptText () < 1 THEN
	Return AncestorReturnValue
END IF	

IF	tab_1.SelectedTab = 4 THEN
	dw_report_view.Event ue_runreport ()
	Return AncestorReturnValue
ELSE
	tab_1.SelectedTab = 4
	Return AncestorReturnValue
END IF
	






end event

type st_report_view from statictext within w_amcp_reports
integer x = 91
integer y = 524
integer width = 2697
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Report is built when this tab is selected. Use File menu options to Print, Print Preview, or Save As a spreadsheet."
boolean focusrectangle = false
end type

type dw_report_view from u_dw within w_amcp_reports
event type integer ue_runreport ( )
event type long ue_acctmanagerbcs ( )
event type long ue_marketshare ( )
integer x = 91
integer y = 596
integer width = 3506
integer height = 1176
integer taborder = 10
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event type integer ue_runreport();//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	Select the datawindow object to be used.
//						Grab the report criteria.
//						Compute the dates to be used.  
//							Developer note:  I know that this CAN be done in each
//							and every procedure.  However, doing the date logic here
//							makes it consistent.  
//						Trigger the appropriate event to retrieve the data.						
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

// Capture the critieria in instance variables.
// We only want to do this once.
date ld_periodend
datetime ldt_start

integer li_empty[]
integer li_month
integer li_periodendmonth
integer li_periodendyear
integer li_year

long	ll_selectedrow

string ls_dataobject
string ls_report
string ls_startyearmonth
string ls_startyearmonthbcs

// Find selected rows for Business Source and Account Manager.
ll_selectedrow = dw_filter_businesssource.GetSelectedRow ( 0 )
IF	ll_selectedrow > 0 THEN
	il_classidnum = dw_filter_businesssource.GetItemNumber ( ll_selectedrow, 'classidnum' )
ELSE
	il_classidnum = -1
END IF
ll_selectedrow = dw_filter_acctmanager.GetSelectedRow ( 0 )
IF	ll_selectedrow > 0 THEN
	il_persidnum = dw_filter_acctmanager.GetItemNumber ( ll_selectedrow, 'am_id' )
ELSE
	il_persidnum = -1
END IF

// Trap the user entered criteria.
is_reportingperiod 	= Left ( Upper ( dw_report_criteria.GetItemString ( 1, 'reportingperiod' ) ), 1 )
ls_dataobject 			= dw_report_criteria.GetItemString ( 1, 'datawindowobject' )
ls_report				= dw_report_criteria.GetItemString ( 1, 'reportname' )
is_reportversion		= dw_report_criteria.GetItemString ( 1, 'reportversion' )
CHOOSE CASE is_reportversion
	CASE 'Account Manager'
		is_reportversion = 'AM'
	CASE 'Regional Manager'
		is_reportversion = 'RM'
	CASE 'Regional Vice President'
		is_reportversion = 'RVP'
	CASE 'Real Estate Business Consultant'
		is_reportversion = 'BC'
	CASE 'Real Estate Regional Sales Director'
		is_reportversion = 'RSD'
	CASE 'Real Estate Regional Vice President'
		is_reportversion = 'REVP'
	CASE ELSE
END CHOOSE

// Assign the dataobject.  This pretty much resets the display.
This.dataobject = ls_dataobject
This.of_SetTransObject ( Parent.itr_report )
This.HSplitScroll = False
This.HSplitScroll = True

// Get the Report Start Date.
ls_startyearmonth		= dw_report_criteria.GetItemString ( 1, 'startyearmonth' )
IF	IsNull ( ls_startyearmonth ) &
	OR Len ( Trim ( ls_startyearmonth ) ) < 1 THEN
	IF	is_reportingperiod = 'A' THEN
		// No dates or other criteria are required.  Just do it.
		// Unassigned Offices, Account Managers with No BCS Factors, and
		// Offices and Clients assigned to expired Account Managers.
		Return This.Retrieve ( )
	ELSE
		// Start Date is required.
		MessageBox ( 'AMCP Report Criteria', 'Start Year/Month is required. Please correct.' )
		Return -1
	END IF
END IF

// Convert the starting year/month to integers.
ii_startyear 			= Integer ( Mid ( ls_startyearmonth, 1, 4 ) )
ii_startmonth			= Integer ( Mid ( ls_startyearmonth, 5 ) )
ldt_start				= &
	DateTime ( Date ( String ( ii_startmonth ) + '/01/' + String ( ii_startyear ) ), &
	Time ( '00:00:00' ) )

// Deal with a request to use average BCS.
ii_averagebcs			= dw_report_criteria.GetItemNumber ( 1, 'averagebcs' )
IF	ii_averagebcs = 1 THEN
	// For the start/year month, BCS is calculated as the average of N
	// months up to the BCS start/year month.  This is repeated for each
	// month to be reported.
	// Example:
	//		Start year/month is 2002 09
	//		BCS start year/month is 2002 08
	//		Average BCS months is 12.
	//		Then BCS for 2002 09 is the average of months 2001 07 through 2002 08.
	//		And BCS for 2002 10 is the average of months 2001 08 through 2002 09.
	ii_averagebcsmonths	= dw_report_criteria.GetItemNumber ( 1, 'averagebcsmonths' )	
	ii_avgbcsoption		= ii_averagebcsmonths
	ls_startyearmonthbcs	= dw_report_criteria.GetItemString ( 1, 'startyearmonthbcs' )	
	ii_startyearbcs 		= Integer ( Mid ( ls_startyearmonthbcs, 1, 4 ) )
	ii_startmonthbcs		= Integer ( Mid ( ls_startyearmonthbcs, 5 ) )
ELSE
	ii_averagebcsmonths	= 0
	ii_avgbcsoption		= 1
	ls_startyearmonthbcs	= ''
	ii_startyearbcs 		= ii_startyear
	ii_startmonthbcs		= ii_startmonth
END IF

// If this is a quarterly report, we need to pass three arguments to the procs.
CHOOSE CASE is_reportingperiod
	CASE 'Q'
		// Compute dates for each month in the quarter.
		ii_quarteryear[1]			= ii_startyear
		ii_quartermonth[1]		= ii_startmonth
		IF	ii_quartermonth[1] = 12 THEN
			ii_quartermonth[2]	= 1
			ii_quarteryear[2]		= ii_quarteryear[1] + 1
		ELSE
			ii_quartermonth[2]	= ii_quartermonth[1] + 1
			ii_quarteryear[2]		= ii_quarteryear[1]
		END IF
		IF	ii_quartermonth[2] = 12 THEN
			ii_quartermonth[3]	= 1
			ii_quarteryear[3]		= ii_quarteryear[2] + 1
		ELSE
			ii_quartermonth[3]	= ii_quartermonth[2] + 1
			ii_quarteryear[3]		= ii_quarteryear[2]
		END IF 
		// Deal with Average BCS dates.			
		IF	ii_averagebcs = 1 THEN
			// The BCS date 'end' is the 'start' year/month entered on the crteria.
			ii_quarteryearbcsend[1]			= ii_startyearbcs
			ii_quartermonthbcsend[1]		= ii_startmonthbcs
			IF	ii_quartermonthbcsend[1] 	= 12 THEN
				ii_quartermonthbcsend[2]	= 1
				ii_quarteryearbcsend[2]		= ii_quarteryearbcsend[1] + 1
			ELSE
				ii_quartermonthbcsend[2]	= ii_quartermonthbcsend[1] + 1
				ii_quarteryearbcsend[2]		= ii_quarteryearbcsend[1]
			END IF 
			IF	ii_quartermonthbcsend[2] 	= 12 THEN
				ii_quartermonthbcsend[3]	= 1
				ii_quarteryearbcsend[3]		= ii_quarteryearbcsend[2] + 1
			ELSE
				ii_quartermonthbcsend[3]	= ii_quartermonthbcsend[2] + 1
				ii_quarteryearbcsend[3]		= ii_quarteryearbcsend[2]
			END IF
			
			// Now back off the user entered number of months to average.
			li_month = ii_startmonthbcs - ii_averagebcsmonths - 1
			IF	li_month < 0 THEN
				li_month = li_month + 12
				li_year 	= ii_startyearbcs - 1
			ELSE
				li_year 	= ii_startyearbcs
			END IF
			
			ii_quarteryearbcsstart[1]		= li_year
			ii_quartermonthbcsstart[1]		= li_month
			IF	ii_quartermonthbcsstart[1] = 12 THEN
				ii_quartermonthbcsstart[2]	= 1
				ii_quarteryearbcsstart[2]	= ii_quarteryearbcsstart[1] + 1
			ELSE
				ii_quartermonthbcsstart[2]	= ii_quartermonthbcsstart[1] + 1
				ii_quarteryearbcsstart[2]	= ii_quarteryearbcsstart[1]
			END IF 
			IF	ii_quartermonthbcsstart[2] = 12 THEN
				ii_quartermonthbcsstart[3]	= 1
				ii_quarteryearbcsstart[3]	= ii_quarteryearbcsstart[2] + 1
			ELSE
				ii_quartermonthbcsstart[3]	= ii_quartermonthbcsstart[2] + 1
				ii_quarteryearbcsstart[3]	= ii_quarteryearbcsstart[2]
			END IF
				
		ELSE
			ii_quarteryearbcsstart	= ii_quarteryear
			ii_quartermonthbcsstart	= ii_quartermonth
			ii_quarteryearbcsend		= ii_quarteryear
			ii_quartermonthbcsend	= ii_quartermonth
		END IF
		// Compute the last day of the Quarter.
		IF	ii_quartermonth[3] = 12 THEN
			li_periodendmonth	= 1
			li_periodendyear 	= ii_quarteryear[3] + 1
		ELSE
			li_periodendmonth = ii_quartermonth[3] + 1
			li_periodendyear 	= ii_quarteryear[3]
		END IF
		
	CASE ELSE
		ii_quarteryear				= li_empty
		ii_quartermonth			= li_empty
		ii_quarteryearbcsstart	= li_empty
		ii_quartermonthbcsstart	= li_empty
		ii_quarteryearbcsstart	= li_empty
		ii_quartermonthbcsstart	= li_empty
		
		// Compute the last day of the Month.
		IF	ii_startmonth = 12 THEN
			li_periodendmonth	= 1
			li_periodendyear 	= ii_startyear + 1
		ELSE
			li_periodendmonth = ii_startmonth + 1
			li_periodendyear 	= ii_startyear
		END IF
END CHOOSE

// Figure out the period end date.
ld_periodend = &
	Date ( String ( li_periodendmonth ) + '/1/' + String ( li_periodendyear ) )
ld_periodend = RelativeDate ( ld_periodend, - 1 )
idt_periodend = DateTime ( ld_periodend, Time ( '00:00:00' ) )

// For testing, strip off the 'grid' or 'tabular' at the end of the datawindow. 
IF	Match ( ls_dataobject, '_grid' ) THEN
	ls_dataobject = Left ( ls_dataobject, Len ( ls_dataobject ) - 5 )
END IF
IF	Match ( ls_dataobject, '_tabular' ) THEN
	ls_dataobject = Left ( ls_dataobject, Len ( ls_dataobject ) - 8 )
END IF
	
// Now figure out which arguments to pass.
CHOOSE CASE Lower ( ls_dataobject )
	CASE 'd_proc_amcprpt_bcsdetail_am', &
		  'd_proc_amcprpt_bcsdetail_rm', &
		  'd_proc_amcprpt_bcsdetail_rvp'
// 01/27/03 Modification.  PHHIT 49939. LANelson.  Add BCSOption to BCS Detail Report.		
		  This.Retrieve ( &
		  						( ii_startyear * 100 ) + ii_startmonth, &
								idt_periodend, &
								il_persidnum, &
								is_reportversion, &
								ii_avgbcsoption &
							  )
// 01/27/03 Modification end.							  
	CASE 'd_proc_amcprpt_leadbudget_am'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_leadbudget_rm'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_leadbudget_rvp'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_leadmarketshare_am'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_leadmarketshare_rm'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_leadmarketshare_rvp'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_loanmarketshare_am'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_loanmarketshare_rm'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_loanmarketshare_rvp'
		This.Event ue_marketshare ()
	CASE 'd_proc_amcprpt_qtrleadsbonus_am'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_qtrleadsbonus_rm'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_qtrleadsbonus_rvp'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_qtrloanstobcs_am'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_qtrloanstobcs_rm'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_proc_amcprpt_qtrloanstobcs_rvp'
		This.Event ue_acctmanagerbcs ()
	CASE 'd_amcp_rpt_offices_dropped'
		This.Retrieve ( ldt_start )
	CASE 'd_amcp_rpt_offices_newly_signed'
		This.Retrieve ( ldt_start )
	CASE 'd_amcp_rpt_offices_newly_unsigned'
		This.Retrieve ( ldt_start )
	CASE 'd_amcp_rpt_offices_unassigned', &
		  'd_amcp_rpt_acctmgr_missing_bcsfactors'
		This.Retrieve ()
	CASE 'd_amcp_rpt_overrides_acctmanager', &
	 	  'd_amcp_rpt_overrides_client', &
	 	  'd_amcp_rpt_overrides_office'
		This.Retrieve ( ( ii_startyear * 100 ) + ii_startmonth )
// 01/27/03 Modification.  PHHIT 49947. LANelson.  Add Account Manager Lead/Loan Detail Report.		
	CASE 'd_amcp_reports_acctmgr_leads_loans'
		IF	il_persidnum = -1 THEN
			MessageBox ( 'AMCP Reports', 'To run Account Manager Lead/Loan Detail, you must select a single Account Manager. ' )
			Return -1
		END IF
		This.Retrieve ( &
							il_persidnum, &
							( ii_startyear * 100 ) + ii_startmonth, &
							ldt_start, &
							idt_periodend &
							)
// 01/27/03 Modification end.							
	CASE ELSE
		// Default.  If we are not ready for this, it will produce
		// an error message. The message is a good thing.  Honest.
		This.Retrieve ( )
END CHOOSE		

This.SetFocus ()

Return 1
end event

event ue_acctmanagerbcs;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Run the AMCP Reports that use AcctManagerAMCP summaries.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

//	@YearMonth1			integer,
//	@YearMonth2			integer,
//	@YearMonth3			integer,
//	@PeriodEndDate 	datetime,
//	@PeriodStartDate 	datetime,
//	@BCSOption			integer,
//	@PersIDNum 			integer,
//	@ReportVersion 	char(3)
// proc_AMCPRpt_LeadBudget
//	(
//	@YearMonth1			integer,
//	@YearMonth2			integer,
//	@YearMonth3			integer,
//	@PeriodEndDate 	datetime,
//	@PeriodStartDate 	datetime,
//	@BCSOption			integer,
//	@PersIDNum 			integer,
//	@ReportVersion 	char(3)
//	)

datetime ldt_periodstart
long ll_rowcount

ldt_periodstart = &
	DateTime ( Date ( String ( ii_quartermonth[1] ) + '/1/' + String ( ii_quarteryear[1] ) ), &
		Time ( '00:00:00' ) )

ll_rowcount =	This.Retrieve ( &
					( ii_quarteryear[1] * 100 ) + ii_quartermonth[1], &
					( ii_quarteryear[2] * 100 ) + ii_quartermonth[2], &
					( ii_quarteryear[3] * 100 ) + ii_quartermonth[3], &
					idt_periodend, &
					ldt_periodstart, &
					ii_avgbcsoption, &
					il_PersIDNum, &
					is_ReportVersion &
					)
					
Return ll_rowcount
end event

event ue_marketshare;//	(	
//	@YearMonth1			integer,
//	@YearMonth2			integer,
//	@YearMonth3			integer,
//	@MonthStart1		datetime,
//	@MonthStart2		datetime,
//	@MonthStart3		datetime,
//	@MonthEnd1			datetime,
//	@MonthEnd2			datetime,
//	@PeriodEndDate 	datetime,
//	@BCSStart1			integer,
//	@BCSStart2			integer,
//	@BCSStart3			integer,
//	@BCSEnd1				integer,
//	@BCSEnd2				integer,
//	@BCSEnd3				integer,
//	@PersIDNum 			integer,
//	@ClassIDNum			integer,
//	@ReportVersion 	char(3)
//	)

date ld_end
date ld_start

datetime ldt_monthend1
datetime ldt_monthend2
datetime ldt_monthstart1
datetime ldt_monthstart2
datetime ldt_monthstart3

long ll_rowcount

time lt_zero

// We need start and end dates for each month in the quarter.
lt_zero = Time ( '00:00:00' )

// First month start date is easy.
ldt_monthstart1 = &
	DateTime ( Date ( String ( ii_quartermonth[1] ) + '/01/' + String ( ii_quarteryear[1] ) ), lt_zero )

// Start date for the second month less one day gives us the end date for the first month.
ld_start = 	Date ( String ( ii_quartermonth[2] ) + '/01/' + String ( ii_quarteryear[2] ) )
ld_end = RelativeDate ( ld_start, - 1 )

ldt_monthstart2 = DateTime ( ld_start, lt_zero )
ldt_monthend1 = DateTime ( ld_end, lt_zero )

// Start date for the third month less one day gives us the end date for the second month.
ld_start = 	Date ( String ( ii_quartermonth[3] ) + '/01/' + String ( ii_quarteryear[3] ) )
ld_end = RelativeDate ( ld_start, - 1 )

ldt_monthstart3 = DateTime ( ld_start, lt_zero )
ldt_monthend2 = DateTime ( ld_end, lt_zero )

// Period End Date is already the end date of the third month.


ll_rowcount =	This.Retrieve ( &
					( ii_quarteryear[1] * 100 ) + ii_quartermonth[1], &
					( ii_quarteryear[2] * 100 ) + ii_quartermonth[2], &
					( ii_quarteryear[3] * 100 ) + ii_quartermonth[3], &
					ldt_monthstart1, &
					ldt_monthstart2, &
					ldt_monthstart3, &
					ldt_monthend1, &
					ldt_monthend2, &
					idt_periodend, &
					( ii_quarteryearbcsstart[1] * 100 ) + ii_quartermonthbcsstart[1], &
					( ii_quarteryearbcsstart[2] * 100 ) + ii_quartermonthbcsstart[2], &
					( ii_quarteryearbcsstart[3] * 100 ) + ii_quartermonthbcsstart[3], &
					( ii_quarteryearbcsend[1] * 100 ) + ii_quartermonthbcsend[1], &
					( ii_quarteryearbcsend[2] * 100 ) + ii_quartermonthbcsend[2], &
					( ii_quarteryearbcsend[3] * 100 ) + ii_quartermonthbcsend[3], &
					il_PersIDNum, &
					il_ClassIDNum, &
					is_ReportVersion, &
					ii_avgbcsoption &
					)	
					
					
Return ll_rowcount
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description: 	We do not update.
//						Turn on the print preview.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setprintpreview ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

end event

type st_report_view_header from statictext within w_amcp_reports
integer x = 91
integer y = 132
integer width = 530
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Report Criteria"
boolean focusrectangle = false
end type

type dw_filter_acctmanager from u_dw within w_amcp_reports
event ue_mousemove pbm_mousemove
event type long ue_deletemanagers ( )
event type integer ue_howmanyrowsselected ( )
event ue_donotselectthefirstrow ( )
string tag = "acctmgr"
integer x = 91
integer y = 364
integer width = 1865
integer height = 1428
integer taborder = 10
string dragicon = "drag.ico"
boolean bringtotop = true
string dataobject = "d_amcp_reports_acctmgr_selection_list"
boolean hsplitscroll = true
end type

event ue_mousemove;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the left mouse button is down over this control,
//						and the user moves the mouse, 
//						and the user has selected at least one row,
//						initiate drag mode.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////


dwitemstatus le_dwitemstatus
long ll_selectedrow

// The user must have selected a group for us to drag anything.
ll_selectedrow = dw_filter_acctmgrrpt_classification.GetRow ()
IF	ll_selectedrow > 0 THEN
	// Be sure the user has saved the current row first.
	le_dwitemstatus = &
		dw_filter_acctmgrrpt_classification.GetItemStatus ( ll_selectedrow, 0, Primary! )
	CHOOSE CASE le_dwitemstatus
		CASE New!, NewModified!
			Return 0
		CASE ELSE
	END CHOOSE
ELSE
	Return
END IF

// If the user has highligted a row, then it is OK to drag.
ll_selectedrow = This.GetSelectedRow ( 0 )

IF	ll_selectedrow > 0 THEN
	
	IF	flags = 1 THEN
	
		// Left mouse button is down.
		// Begin drag mode.
		This.Drag (Begin!)
		
	END IF
		
END IF

Return 0
end event

event ue_deletemanagers;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						The user has dropped a list of selected Account Managers
//						from the report group list.  We want to delete them
//						from the report group and NOT from this list.
//
//	Arguments: 		None
//
//	Returns:	Long	Number of rows deleted.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_idx
long ll_max

long ll_rowstodelete[]
long ll_selectedrow

// We need to delete from bottom of list to the top.
ll_selectedrow = dw_filter_acctmanager_amcpreportgroup.GetSelectedRow ( 0 )

DO WHILE ll_selectedrow > 0	

	// Keep track of the rows to delete.
	ll_max = ll_max + 1
	ll_rowstodelete[ll_max] = ll_selectedrow
	
	// Get the next selected row.
	ll_selectedrow = dw_filter_acctmanager_amcpreportgroup.GetSelectedRow ( ll_selectedrow )
	
LOOP

// Now work backwards to delete.
FOR ll_idx = ll_max TO 1 STEP -1
	dw_filter_acctmanager_amcpreportgroup.DeleteRow ( ll_rowstodelete[ll_idx] )
NEXT

// Save.
Parent.Event pfc_save ()

Return ll_max
end event

event ue_howmanyrowsselected;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Selection changing check.
//
//						The user can only select one account manager row for report
//						criteria
//
//	Arguments: 		None
//
//	Returns:	Integer
//						> 1 	Too many rows selected
//						1 		Only one row selected
//						0		No rows selected.
//						-1		Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_selectedrow

ll_selectedrow = This.GetSelectedRow ( 0 )
IF	ll_selectedrow < 1 THEN
	Return 0
END IF

ll_selectedrow = This.GetSelectedRow ( ll_selectedrow )

IF	ll_selectedrow > 0 THEN
	Return 2
END IF

Return 1

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:   We also allow multirow selection.
//						We allow sorts.
//						Handle AMCP Update security.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

This.of_SetSort ( True )
This.inv_sort.of_SetColumnHeader ( True )

This.of_SetRowSelect ( True )
This.inv_rowselect.of_setstyle ( 2 ) // Extended selection.

IF	gnv_app.ib_amcp_update THEN
	This.ib_isupdateable = True
ELSE
	This.ib_isupdateable = False
	This.object.am_amcprptexcluded.protect = '1'
END IF

Parent.is_acctmanager_dragicon = This.dragicon
This.Tag = 'acctmgr'

end event

event dragenter;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the account manager report group is dragged into this
//						control, swap the icon to give the user a droppability hint.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the account manager report group list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'amrptgroup' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = 'rows.ico'
		END IF
END CHOOSE

Return 0
end event

event dragleave;call super::dragleave;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the account manager report group list is dragged out of this
//						control, swap the icon back to the original dragicon.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the on the account manager report group list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'amrptgroup' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = Parent.is_amcpreportgroup_dragicon
		END IF
END CHOOSE

Return 0
end event

event dragdrop;call super::dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the account manager report group list is dropped on this
//						control, then we need to add the account manager's
//						on the list to this group.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the account manager list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'amrptgroup' THEN
			// Stop the dragging.
			ldw_dropped.Drag ( End! )
			// Trigger the add managers event.
			This.Event ue_deletemanagers ()
			ldw_dropped.DragIcon = Parent.is_amcpreportgroup_dragicon
		END IF
END CHOOSE

Return 0
end event

type dw_filter_acctmanager_amcpreportgroup from u_dw within w_amcp_reports
event type integer ue_addmanagers ( )
event ue_mousemove pbm_mousemove
integer x = 2007
integer y = 816
integer width = 1563
integer height = 976
integer taborder = 20
string dragicon = "drag1.ico"
boolean bringtotop = true
string dataobject = "d_amcp_reports_amcpreportgroup"
end type

event ue_addmanagers;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Add Account Managers to the selected Reporting Group.
//
//						MOVE all selected rows from the Account Manager List
// 					datawindow to this control, eliminate duplicates,
//						fill in the ClassIDNum field, and save.
//
//	Arguments:  none
//
//	Returns:  long
//	 >0 	= Count of added rows.
//	 0 	= No action
//	-1 	= Error
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_classidnum
long ll_idx
long ll_max
long ll_row
long ll_selected_am_id[]

string ls_findstring

// Grab the ClassIDNum of the currently selected Group.
ll_row = dw_filter_acctmgrrpt_classification.GetRow ()
IF	ll_row > 0 THEN
	ll_classidnum = &
		dw_filter_acctmgrrpt_classification.GetItemNumber ( ll_row, 'classidnum' )
ELSE
	// We shouldn't even be here.  No message. Just fail.
	Return -1
END IF

// We need to delete from bottom of list to the top.
ll_selected_am_id = dw_filter_acctmanager.object.am_id.selected

ll_max 				= UpperBound ( ll_selected_am_id )

FOR ll_idx = 1 TO ll_max
	// Be sure that the account manager is not already on the list.
	// If the row exists, then just skip it. We have to keep using rowcount () to be
	// sure we screen out duplicates being dropped.
	ls_findstring = 'am_id=' + String ( ll_selected_am_id[ll_idx] )
	ll_row = This.Find ( ls_findstring, 1, This.RowCount () )
	IF	ll_row > 0 THEN
		CONTINUE
	END IF
	
	// Insert the row.
	ll_row = This.InsertRow ( 0 )
	This.SetItem ( ll_row, 'amcpreportgroup_classidnum', ll_classidnum )
	This.SetItem ( ll_row, 'am_id', ll_selected_am_id[ll_idx] )
	
NEXT

// Save.
Parent.Event pfc_save ()

// Regardless of save success/failure, we are going to retrieve again.
// There is nothing the user can do to 'fix' a save failure.
This.Retrieve ( ll_classidnum )
	
Return ll_max

end event

event ue_mousemove;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the left mouse button is down over this control,
//						and the user moves the mouse, 
//						and the user has selected at least one row,
//						initiate drag mode.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// If the user has highligted a row, then it is OK to drag.
long ll_selectedrow

ll_selectedrow = This.GetSelectedRow ( 0 )

IF	ll_selectedrow > 0 THEN
	
	IF	flags = 1 THEN
	
		// Left mouse button is down.
		// Begin drag mode.
		This.Drag (Begin!)
		
	END IF
		
END IF

Return 0
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Handle AMCP Update security.  Extended row selection.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	gnv_app.ib_amcp_update THEN
	This.ib_isupdateable = True
ELSE
	This.ib_isupdateable = False
END IF

This.of_SetRowSelect ( True )
This.inv_rowselect.of_SetStyle ( 2 )

Parent.is_amcpreportgroup_dragicon = This.dragicon
This.Tag = 'amrptgroup'
end event

event dragdrop;call super::dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the Account Manager list is dropped on this
//						control, then we need to add the account manager's
//						on the list to this group.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_selectedrow
Datawindow	ldw_dropped

// Determine whether or not we have a group selected.
ll_selectedrow = dw_filter_acctmgrrpt_classification.GetRow ()
IF	ll_selectedrow > 0 THEN
ELSE
	Return
END IF

// Determine if the dragged object is the account manager list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'acctmgr' THEN
			// Stop the dragging.
			ldw_dropped.Drag ( End! )
			// Trigger the add managers event.
			This.Event ue_addmanagers ()
			ldw_dropped.DragIcon = Parent.is_acctmanager_dragicon
		END IF
END CHOOSE

Return 0
end event

event dragenter;call super::dragenter;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the account manager list is dragged into this
//						control, swap the icon to give the user a droppability hint.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_selectedrow
Datawindow	ldw_dropped

// Determine whether or not we have a group selected.
ll_selectedrow = dw_filter_acctmgrrpt_classification.GetRow ()
IF	ll_selectedrow > 0 THEN
ELSE
	Return
END IF


// Determine if the dragged object is the account manager list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'acctmgr' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = 'rows.ico'
		END IF
END CHOOSE

Return 0
end event

event dragleave;call super::dragleave;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the account manager list is dragged out of this
//						control, swap the icon back to the original dragicon.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the on the account manager list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'acctmgr' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = Parent.is_acctmanager_dragicon
		END IF
END CHOOSE

Return 0
end event

type st_filter_acctmanager_1 from statictext within w_amcp_reports
integer x = 91
integer y = 136
integer width = 3154
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check the Exclude checkbox to exclude the Account Manager from the reports.  Selections persist until modified by the user."
boolean focusrectangle = false
end type

type st_filter_acctmanager_2 from statictext within w_amcp_reports
integer x = 91
integer y = 200
integer width = 2926
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a row to run a report for a single Account Manager.  Highlighted rows do not persist after the window is closed."
boolean focusrectangle = false
end type

type st_filter_acctmgrrpt_classification from statictext within w_amcp_reports
integer x = 2007
integer y = 300
integer width = 855
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Manager Groups"
boolean focusrectangle = false
end type

type st_filter_acctmanager_amcpreportgroup from statictext within w_amcp_reports
integer x = 2007
integer y = 748
integer width = 969
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Managers for Selected Group"
boolean focusrectangle = false
end type

type st_filter_acctmanager_header from statictext within w_amcp_reports
integer x = 91
integer y = 300
integer width = 855
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tier 1 Account Managers"
boolean focusrectangle = false
end type

type dw_filter_acctmgrrpt_classification from u_dw within w_amcp_reports
integer x = 2007
integer y = 364
integer width = 1563
integer height = 352
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_amcp_reports_acctmgrrpt_classification"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Handle AMCP Update security.
//						Do our own  linkage.  See rowfocuschanged event.
//						Turn on required column.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.of_SetReqColumn ( True )

IF	gnv_app.ib_amcp_update THEN
	This.ib_isupdateable = True
ELSE
	This.ib_isupdateable = False
END IF

IF	gnv_app.ib_amcp_update THEN
	This.Retrieve ()
END IF

This.SetRowFocusIndicator ( Hand! )
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor.  To handle the buttons.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer li_return
long ll_classidnum
long ll_row
long ll_newrow
long ll_selectedrow
string ls_findstring

IF IsValid ( dwo ) THEN
ELSE
	Return AncestorReturnValue
END IF

CHOOSE CASE dwo.name
		
	CASE 'b_add'		
		// Clear up any row selection.
		// Insert a row, assign a key.
		
		dw_filter_acctmanager_amcpreportgroup.Reset ()
		ll_newrow = This.InsertRow ( row )
		
		ll_classidnum = SQLCA.get_next_uniqidnum ( "CLASS" )
		
		This.SetItem ( ll_newrow, 'classidnum', ll_classidnum )
		This.SetItem ( ll_newrow, 'classgrpidnum', 24 )
		This.SetItem ( ll_newrow, 'amcprptexcluded', 0 )
		This.SetItem ( ll_newrow, 'bgneffdate', DateTime ( Today (), Time ( '00:00:00' ) ) )
		This.SetItem ( ll_newrow, 'endeffdate', DateTime ( Date ( '12/31/2099' ), Time ( '00:00:00' ) ) )
		
		Return AncestorReturnValue
		
	CASE 'b_delete'
		// First check on whether or not we know which row to delete.
		// If we do, first delete all of the related account managers.
		// If this is successful, then delete the group itself.
		ll_selectedrow = This.GetRow ()
		IF	ll_selectedrow > 0 THEN
			ll_classidnum = This.GetItemNumber ( ll_selectedrow, 'classidnum' )
			ll_row = dw_filter_acctmanager_amcpreportgroup.Retrieve ( ll_classidnum )
			li_return = MessageBox ( 'Delete Account Manager Group?', &
				String ( ll_row ) + " Account Managers are assigned to the Group.  They will also be deleted." &
				+ ' Confirm?', Question!, YesNo! )
			IF	 li_return = 1 THEN
			ELSE
				Return AncestorReturnValue
			END IF
			dw_filter_acctmanager_amcpreportgroup.DeleteRow ( 0 )
			IF	Parent.Event pfe_save () < 0 THEN
				Return AncestorReturnValue
			END IF
			This.DeleteRow ( row )
			IF	Parent.Event pfe_save () < 0 THEN
				Return AncestorReturnValue
			END IF
		ELSE
			MessageBox ( 'Delete Account Manager Group', 'Please click on the group you want to delete.' )
		END IF
		Return AncestorReturnValue
		
	CASE ELSE
		
END CHOOSE

Return AncestorReturnValue 

	
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor.  Refresh the list of account managers
//						assigned to this group.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_classidnum

dw_filter_acctmanager_amcpreportgroup.Reset ()

IF	currentrow > 0 THEN
	ll_classidnum = This.GetItemNumber ( currentrow, 'classidnum' )
	dw_filter_acctmanager_amcpreportgroup.Retrieve ( ll_classidnum )
END IF
	
Return AncestorReturnValue	
	
end event


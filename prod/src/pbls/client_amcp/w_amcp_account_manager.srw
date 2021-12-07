$PBExportHeader$w_amcp_account_manager.srw
forward
global type w_amcp_account_manager from w_client_sheet
end type
type dw_selected_account_manager from u_dw within w_amcp_account_manager
end type
type tab_1 from u_tab_client within w_amcp_account_manager
end type
type tab_1 from u_tab_client within w_amcp_account_manager
end type
type st_account_manager_bcs_factors_comment from statictext within w_amcp_account_manager
end type
type st_account_manager_bcs_factors from statictext within w_amcp_account_manager
end type
type dw_account_manager_bcs_factors_comment from u_dw within w_amcp_account_manager
end type
type dw_amcp_factors_update from u_dw within w_amcp_account_manager
end type
type st_amcp_factors_comment from statictext within w_amcp_account_manager
end type
type dw_amcp_factors_update_comment from u_dw within w_amcp_account_manager
end type
type st_amcp_factors from statictext within w_amcp_account_manager
end type
type st_assign_offices_heading_1 from statictext within w_amcp_account_manager
end type
type st_assign_offices_heading_2 from statictext within w_amcp_account_manager
end type
type st_unassigned_unsigned_offices from statictext within w_amcp_account_manager
end type
type st_assigned_unsigned_offices from statictext within w_amcp_account_manager
end type
type dw_client_signed_office_history from u_dw within w_amcp_account_manager
end type
type dw_unsigned_office_history from u_dw within w_amcp_account_manager
end type
type st_client_signed_office_history from statictext within w_amcp_account_manager
end type
type st_unsigned_office_history from statictext within w_amcp_account_manager
end type
type st_account_manager_search_critieria from statictext within w_amcp_account_manager
end type
type dw_account_manager_search_criteria from u_dw within w_amcp_account_manager
end type
type st_account_manager_list from statictext within w_amcp_account_manager
end type
type dw_account_manager_list from u_dw within w_amcp_account_manager
end type
type dw_unassigned_unsigned_office_list from u_dw within w_amcp_account_manager
end type
type dw_assigned_unsigned_office_list from u_dw within w_amcp_account_manager
end type
type dw_override_entry from u_dw within w_amcp_account_manager
end type
type dw_override_entry_comment from u_dw within w_amcp_account_manager
end type
type dw_override_history from u_dw within w_amcp_account_manager
end type
type dw_account_manager_bcs_factors from u_dw within w_amcp_account_manager
end type
type dw_override_leadloan_detail from u_dw within w_amcp_account_manager
end type
end forward

global type w_amcp_account_manager from w_client_sheet
integer width = 3685
integer height = 2016
string title = "Account Manager AMCP Maintenance"
string menuname = "m_update_amcp"
event type integer ue_clearcriteria ( )
dw_selected_account_manager dw_selected_account_manager
tab_1 tab_1
st_account_manager_bcs_factors_comment st_account_manager_bcs_factors_comment
st_account_manager_bcs_factors st_account_manager_bcs_factors
dw_account_manager_bcs_factors_comment dw_account_manager_bcs_factors_comment
dw_amcp_factors_update dw_amcp_factors_update
st_amcp_factors_comment st_amcp_factors_comment
dw_amcp_factors_update_comment dw_amcp_factors_update_comment
st_amcp_factors st_amcp_factors
st_assign_offices_heading_1 st_assign_offices_heading_1
st_assign_offices_heading_2 st_assign_offices_heading_2
st_unassigned_unsigned_offices st_unassigned_unsigned_offices
st_assigned_unsigned_offices st_assigned_unsigned_offices
dw_client_signed_office_history dw_client_signed_office_history
dw_unsigned_office_history dw_unsigned_office_history
st_client_signed_office_history st_client_signed_office_history
st_unsigned_office_history st_unsigned_office_history
st_account_manager_search_critieria st_account_manager_search_critieria
dw_account_manager_search_criteria dw_account_manager_search_criteria
st_account_manager_list st_account_manager_list
dw_account_manager_list dw_account_manager_list
dw_unassigned_unsigned_office_list dw_unassigned_unsigned_office_list
dw_assigned_unsigned_office_list dw_assigned_unsigned_office_list
dw_override_entry dw_override_entry
dw_override_entry_comment dw_override_entry_comment
dw_override_history dw_override_history
dw_account_manager_bcs_factors dw_account_manager_bcs_factors
dw_override_leadloan_detail dw_override_leadloan_detail
end type
global w_amcp_account_manager w_amcp_account_manager

type variables
// Drag-drop logic.
string is_dragicon_unassigned
string is_dragicon_assigned
n_ds ids_clientfranchise
n_ds ids_officeacctmanager
end variables

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Triggered by Clear Criteria menu.  Reset/insert a row.
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


IF	tab_1.SelectedTab = 1 THEN
	dw_account_manager_search_criteria.Event ue_clearcriteria ()
END IF

Return 1
end event

on w_amcp_account_manager.create
int iCurrent
call super::create
if this.MenuName = "m_update_amcp" then this.MenuID = create m_update_amcp
this.dw_selected_account_manager=create dw_selected_account_manager
this.tab_1=create tab_1
this.st_account_manager_bcs_factors_comment=create st_account_manager_bcs_factors_comment
this.st_account_manager_bcs_factors=create st_account_manager_bcs_factors
this.dw_account_manager_bcs_factors_comment=create dw_account_manager_bcs_factors_comment
this.dw_amcp_factors_update=create dw_amcp_factors_update
this.st_amcp_factors_comment=create st_amcp_factors_comment
this.dw_amcp_factors_update_comment=create dw_amcp_factors_update_comment
this.st_amcp_factors=create st_amcp_factors
this.st_assign_offices_heading_1=create st_assign_offices_heading_1
this.st_assign_offices_heading_2=create st_assign_offices_heading_2
this.st_unassigned_unsigned_offices=create st_unassigned_unsigned_offices
this.st_assigned_unsigned_offices=create st_assigned_unsigned_offices
this.dw_client_signed_office_history=create dw_client_signed_office_history
this.dw_unsigned_office_history=create dw_unsigned_office_history
this.st_client_signed_office_history=create st_client_signed_office_history
this.st_unsigned_office_history=create st_unsigned_office_history
this.st_account_manager_search_critieria=create st_account_manager_search_critieria
this.dw_account_manager_search_criteria=create dw_account_manager_search_criteria
this.st_account_manager_list=create st_account_manager_list
this.dw_account_manager_list=create dw_account_manager_list
this.dw_unassigned_unsigned_office_list=create dw_unassigned_unsigned_office_list
this.dw_assigned_unsigned_office_list=create dw_assigned_unsigned_office_list
this.dw_override_entry=create dw_override_entry
this.dw_override_entry_comment=create dw_override_entry_comment
this.dw_override_history=create dw_override_history
this.dw_account_manager_bcs_factors=create dw_account_manager_bcs_factors
this.dw_override_leadloan_detail=create dw_override_leadloan_detail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_selected_account_manager
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.st_account_manager_bcs_factors_comment
this.Control[iCurrent+4]=this.st_account_manager_bcs_factors
this.Control[iCurrent+5]=this.dw_account_manager_bcs_factors_comment
this.Control[iCurrent+6]=this.dw_amcp_factors_update
this.Control[iCurrent+7]=this.st_amcp_factors_comment
this.Control[iCurrent+8]=this.dw_amcp_factors_update_comment
this.Control[iCurrent+9]=this.st_amcp_factors
this.Control[iCurrent+10]=this.st_assign_offices_heading_1
this.Control[iCurrent+11]=this.st_assign_offices_heading_2
this.Control[iCurrent+12]=this.st_unassigned_unsigned_offices
this.Control[iCurrent+13]=this.st_assigned_unsigned_offices
this.Control[iCurrent+14]=this.dw_client_signed_office_history
this.Control[iCurrent+15]=this.dw_unsigned_office_history
this.Control[iCurrent+16]=this.st_client_signed_office_history
this.Control[iCurrent+17]=this.st_unsigned_office_history
this.Control[iCurrent+18]=this.st_account_manager_search_critieria
this.Control[iCurrent+19]=this.dw_account_manager_search_criteria
this.Control[iCurrent+20]=this.st_account_manager_list
this.Control[iCurrent+21]=this.dw_account_manager_list
this.Control[iCurrent+22]=this.dw_unassigned_unsigned_office_list
this.Control[iCurrent+23]=this.dw_assigned_unsigned_office_list
this.Control[iCurrent+24]=this.dw_override_entry
this.Control[iCurrent+25]=this.dw_override_entry_comment
this.Control[iCurrent+26]=this.dw_override_history
this.Control[iCurrent+27]=this.dw_account_manager_bcs_factors
this.Control[iCurrent+28]=this.dw_override_leadloan_detail
end on

on w_amcp_account_manager.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_selected_account_manager)
destroy(this.tab_1)
destroy(this.st_account_manager_bcs_factors_comment)
destroy(this.st_account_manager_bcs_factors)
destroy(this.dw_account_manager_bcs_factors_comment)
destroy(this.dw_amcp_factors_update)
destroy(this.st_amcp_factors_comment)
destroy(this.dw_amcp_factors_update_comment)
destroy(this.st_amcp_factors)
destroy(this.st_assign_offices_heading_1)
destroy(this.st_assign_offices_heading_2)
destroy(this.st_unassigned_unsigned_offices)
destroy(this.st_assigned_unsigned_offices)
destroy(this.dw_client_signed_office_history)
destroy(this.dw_unsigned_office_history)
destroy(this.st_client_signed_office_history)
destroy(this.st_unsigned_office_history)
destroy(this.st_account_manager_search_critieria)
destroy(this.dw_account_manager_search_criteria)
destroy(this.st_account_manager_list)
destroy(this.dw_account_manager_list)
destroy(this.dw_unassigned_unsigned_office_list)
destroy(this.dw_assigned_unsigned_office_list)
destroy(this.dw_override_entry)
destroy(this.dw_override_entry_comment)
destroy(this.dw_override_history)
destroy(this.dw_account_manager_bcs_factors)
destroy(this.dw_override_leadloan_detail)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description: Set up tab pages for AMCP Account Manager view.
//		Rules:		Only AMCP users may view tab pages with Compensation data.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

// Disable the AMCP menu unless this is an AMCP user.
m_client lm_client
IF	gnv_app.ib_amcp_update THEN
ELSE
	lm_client = This.MenuID
	lm_client.m_amcp.visible = False
END IF

tab_1.Event ue_settabcontrol ()

This.ids_clientfranchise = Create n_ds
This.ids_clientfranchise.dataobject = 'd_office_clntfranchise_hidden'
This.ids_clientfranchise.of_SetTransObject ( SQLCA )

This.ids_officeacctmanager = Create n_ds
This.ids_officeacctmanager.dataobject = 'd_office_officeaccountmanager_hidden'
This.ids_officeacctmanager.of_SetTransObject ( SQLCA )



end event

event pfe_postsave;call super::pfe_postsave;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Fix this so that it NEVER returns a null value.
//						Instead return the value we were passed by the pfc_save ()
//						event.
//
//						Otherwise, the fact that the update was sucessful or
//						unsuccessful is lost.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Return ai_save_rc
end event

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Tidy up.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	IsValid ( This.ids_clientfranchise ) THEN
	Destroy ( This.ids_clientfranchise )
END IF

IF	IsValid ( This.ids_officeacctmanager ) THEN
	Destroy ( This.ids_officeacctmanager )
END IF
end event

type dw_selected_account_manager from u_dw within w_amcp_account_manager
integer x = 14
integer y = 12
integer width = 3621
integer height = 172
integer taborder = 10
string dataobject = "d_search_accountmanager_selected"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Be sure we are displaying a blank row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.Reset ()
This.InsertRow ( 0 )

This.tag = ''


end event

type tab_1 from u_tab_client within w_amcp_account_manager
event type integer ue_enabletabpages ( )
event type integer ue_disabletabpages ( )
integer x = 14
integer y = 188
integer width = 3621
integer height = 1668
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event ue_enabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable tab pages 2 thru 5.
//						Trigger this event when an account manager is selected.
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

integer li_idx

FOR li_idx = 2 to 5
	This.Control[li_idx].enabled = True
NEXT

Return 1

end event

event ue_disabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Disable tab pages 2 thru 5.
//						Reset all datawindows for an account manager.
//						Trigger this event when an account manager is deselected.
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

datawindow ldw_temp

integer li_idx
integer li_max

// Disable the tabs.
FOR li_idx = 2 to 5
	This.Control[li_idx].enabled = False
NEXT

// Reset all the datawindows retrieved using account manager's PersIDNum as
// an arguement.  Identify controls to be reset using the tag.
li_max = UpperBound ( Parent.Control )
FOR li_idx = 1 TO li_max
	
	CHOOSE CASE Parent.Control[li_idx].TypeOf ()
			
		CASE datawindow!
			
			ldw_temp = Parent.Control[li_idx]
			IF	Lower ( Left ( ldw_temp.tag, 2 ) ) = 'am' THEN
				ldw_temp.Reset ()
			END IF
			
		CASE ELSE
			
	END CHOOSE	
	
NEXT

Return 1

end event

event ue_settabcontrol;call super::ue_settabcontrol;///////////////////////////////////////////////////////////////////////
//
// Description:	Use this event to call the of_createtab () function.
//						Use this event to call the of_wiretab () function.
//
//		Rules:		Only AMCP users may view tab pages with Compensation data.
//
//	Returns:	Integer	1 Success
//							-1 Failure
//
//////////////////////////////////////////////////////////////////////////////	
//
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

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
tab_1.visible 								= True
dw_selected_account_manager.visible	= True

// Enforce Security.
IF	gnv_app.ib_amcp_update THEN
	// User may view and update pretty much everything.
	
	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select AM'
	ls_tabs[2]	= 'Assign Offices'
	ls_tabs[3]	= 'View Assignment History'
	ls_tabs[4]	= 'Update BCS Factors'
	ls_tabs[5]	= 'Override Closed Loans'
	ls_tabs[6]	= 'Update AMCP Factors'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select AM tab page.
	lgo_tabs[1]	= dw_account_manager_search_criteria
	lgo_tabs[2]	= dw_account_manager_list
	lgo_tabs[3]	= st_account_manager_search_critieria
	lgo_tabs[4]	= st_account_manager_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Assign Offices tab page.
	lgo_tabs[1]	= dw_unassigned_unsigned_office_list
	lgo_tabs[2]	= dw_assigned_unsigned_office_list
	lgo_tabs[3]	= st_assign_offices_heading_1
	lgo_tabs[4]	= st_assign_offices_heading_2
	lgo_tabs[5]	= st_unassigned_unsigned_offices
	lgo_tabs[6]	= st_assigned_unsigned_offices
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_unsigned_office_history
	lgo_tabs[2]	= dw_client_signed_office_history
	lgo_tabs[3]	= st_unsigned_office_history
	lgo_tabs[4]	= st_client_signed_office_history
	This.of_wiretab ( 3, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Update BCS Factors tab page.
	lgo_tabs[1]	= dw_account_manager_bcs_factors
	lgo_tabs[2]	= dw_account_manager_bcs_factors_comment
	lgo_tabs[3]	= st_account_manager_bcs_factors_comment
	lgo_tabs[4]	= st_account_manager_bcs_factors
	This.of_wiretab ( 4, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Override Closed Loans tab page.
	lgo_tabs[1]	= dw_override_entry
	lgo_tabs[2]	= dw_override_entry_comment
	lgo_tabs[3]	= dw_override_history
	This.of_wiretab ( 5, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Update AMCP Factors tab page.
	lgo_tabs[1]	= dw_amcp_factors_update
	lgo_tabs[2]	= dw_amcp_factors_update_comment
	lgo_tabs[3] = st_amcp_factors_comment
	lgo_tabs[4] = st_amcp_factors
	This.of_wiretab ( 6, lgo_tabs )
	lgo_tabs		= lgo_null
	
ELSE
	// User is not allowed to view or update AMCP data.

	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select AM'
	ls_tabs[2]	= 'Assign Offices'
	ls_tabs[3]	= 'View Assignment History'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select AM tab page.
	lgo_tabs[1]	= dw_account_manager_search_criteria
	lgo_tabs[2]	= dw_account_manager_list
	lgo_tabs[3]	= st_account_manager_search_critieria
	lgo_tabs[4]	= st_account_manager_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Assign Offices tab page.
	lgo_tabs[1]	= dw_unassigned_unsigned_office_list
	lgo_tabs[2]	= dw_assigned_unsigned_office_list
	lgo_tabs[3]	= st_assign_offices_heading_1
	lgo_tabs[4]	= st_assign_offices_heading_2
	lgo_tabs[5]	= st_unassigned_unsigned_offices
	lgo_tabs[6]	= st_assigned_unsigned_offices
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_unsigned_office_history
	lgo_tabs[2]	= dw_client_signed_office_history
	lgo_tabs[3]	= st_unsigned_office_history
	lgo_tabs[4]	= st_client_signed_office_history
	This.of_wiretab ( 3, lgo_tabs )
	lgo_tabs		= lgo_null
	
END IF

// Be sure we do not obsure the view.
This.BringToTop = False

// Disable tab pages until an account manager is selected.
This.Event ue_disabletabpages ()

// Force selection of the first tab page.
This.SelectedTab = 1

Return 1
end event

event selectionchanging;call super::selectionchanging;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Save any prior updates.
//						Check to be sure we have the right stuff to open the tab.
//						Call the function to display the corresponding datawindows.
//						Retrievals are done in the selectionchanged event.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer li_idx
integer li_max
integer li_return

long ll_am_persidnum

// Check for updates.
li_return = Parent.Event pfc_save ()
IF li_return < 0 THEN
	Return 1
END IF

// Trap requests to return to search tab or to AMCP Factors tab.
CHOOSE CASE	newindex
	CASE 1, 6
		// Make the controls associated with the newly selected tab visible.
		This.of_setwiredobjectvisibility ( newindex )
		Return 0
END CHOOSE

// Be sure we have a selected account manager.
ll_am_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )
IF	IsNull ( ll_am_persidnum ) THEN
	CHOOSE CASE newindex
		CASE 2,3,4,5
			MessageBox ( 'Account Manager', 'Please select an Account Manager.', Information!, OK! )
			Return 1
	END CHOOSE
END IF

// Make the controls associated with the newly selected tab visible.
This.of_setwiredobjectvisibility ( newindex )

// Modification 01/27/2003.  PHHIT 49939. LANelson
// Make the Lead/Loan Detail report invisible.
dw_override_leadloan_detail.visible = False
// Modification 01/27/2003 end.

Return 0
end event

event selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Retrieve data for the new tab.
//						SetFocus to the appropriate control.
//						Enable/Disable Edit and View menu items.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_am_persidnum
long ll_month
long ll_year
m_update_amcp lm_update_amcp
string ls_filterstring
window lw_parent

// Get a reference to our parent window's menu.
This.of_getparentwindow ( lw_parent )
lm_update_amcp = lw_parent.MenuID

// Get the PersIDNum of the Selected Account Manager.
ll_am_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

// Do the necessary retrievals for the newly selected tab.
// Enable/disable menu items.
CHOOSE CASE newindex
		
	CASE 1
		// Select Account Manager.
		// No action required.
		
		// No updates.
		lm_update_amcp.m_edit.enabled = False
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= False
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= True
		
	CASE 2
		// Assign Offices.
		dw_unassigned_unsigned_office_list.Retrieve ()
		dw_unassigned_unsigned_office_list.SetFocus ()
		dw_assigned_unsigned_office_list.Retrieve ( ll_am_persidnum )
		
		// We only want Save enabled.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= False
		
	CASE 3
		// Assignment History.		
		dw_client_signed_office_history.Retrieve ( ll_am_persidnum )
		dw_client_signed_office_history.SetFocus ()
		dw_unsigned_office_history.Retrieve ( ll_am_persidnum )
		
		// No updates.
		lm_update_amcp.m_edit.enabled = False
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= False
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= False
		
	CASE 4
		// BCS Factors.
		dw_account_manager_bcs_factors.Retrieve ( ll_am_persidnum )
		dw_account_manager_bcs_factors.SetFocus ()
		
		// We do not delete or undelete.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= True
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = True
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists cannot be sorted or filtered.
		lm_update_amcp.m_view.enabled = False
		
	CASE 5
		// Override BCS.
		dw_override_entry.Retrieve ( ll_am_persidnum )
		dw_override_entry.SetFocus ()
		dw_override_history.Retrieve ( ll_am_persidnum )
		IF	dw_override_entry.RowCount () > 0 THEN			
			// Filter the history display.			
			ll_month = dw_override_entry.GetItemNumber ( 1, 'month' )
			ll_year	= dw_override_entry.GetItemNumber ( 1, 'year' )
			ls_filterstring = 'month=' + String (ll_month ) &
				+ ' and year=' + String ( ll_year )
			dw_override_history.SetFilter ( ls_filterstring )
			dw_override_history.Filter ()	
		END IF	
		
		// We do not delete or undelete.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = True
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists cannot be sorted or filtered.
		lm_update_amcp.m_view.enabled = False
		
		
	CASE 6
		// AMCP Factors.
		dw_amcp_factors_update.Retrieve ()
		dw_amcp_factors_update.SetFocus ()
		
		// We do not delete or undelete.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= True
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = True
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists cannot be sorted or filtered.
		lm_update_amcp.m_view.enabled = False
		
		
END CHOOSE

Return 0
end event

type st_account_manager_bcs_factors_comment from statictext within w_amcp_account_manager
integer x = 1385
integer y = 300
integer width = 1065
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comment for selected Begin Year/Month"
boolean focusrectangle = false
end type

type st_account_manager_bcs_factors from statictext within w_amcp_account_manager
integer x = 78
integer y = 300
integer width = 1134
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Account Manager~'s BCS Factors"
boolean focusrectangle = false
end type

type dw_account_manager_bcs_factors_comment from u_dw within w_amcp_account_manager
integer x = 1385
integer y = 372
integer width = 2025
integer height = 572
integer taborder = 40
string dataobject = "d_accountmanager_bcs_factors_comment"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We share data and so are not updateable.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.tag = ''
end event

event ue_dwnkey;call super::ue_dwnkey;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Control scrolling.
//
//	Arguments:  keycode		key
//					unsignedlog	keyflags
//
//	Returns:  long
//	 1 = Success
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_current_row

CHOOSE CASE key
	CASE	KeyPageUp!, &
			KeyPageDown!, &
			KeyEnd!, &
			KeyHome!, &
			KeyLeftArrow!, &
			KeyUpArrow!, &
			KeyRightArrow!, &
			KeyDownArrow!, &
			KeyTab!, &
			KeyEnter!
		
		// We cannot stop the action from being performed.
		// We can only scroll back to the current row.
		ll_current_row = This.GetRow ()
		This.Post ScrollToRow ( ll_current_row )
		
	CASE ELSE
END CHOOSE

Return 0
end event

type dw_amcp_factors_update from u_dw within w_amcp_account_manager
integer x = 50
integer y = 364
integer width = 2181
integer height = 1452
integer taborder = 10
string dataobject = "d_acmp_constants"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Share data with the comments display.
//						Turn on required column service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ShareData ( dw_amcp_factors_update_comment )

This.of_SetReqColumn ( True )

This.SetRowFocusIndicator ( Hand! )

This.tag = ''
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Scroll the comment datawindow to the same row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

dw_amcp_factors_update_comment.ScrollToRow ( currentrow )

Return AncestorReturnValue
end event

event type integer pfc_validation();call super::pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Convert the entered Percents to the decimal fraction.
//
//						Verify that the Begin Year/Month leave no gaps
//						between this row and the prior one.
//						
//						Note that required data is checked by the ancestor script.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// Be sure to stop if the ancestor script has trapped errors.
IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
END IF

dwitemstatus le_itemstatus

long ll_begindate
long ll_beginmonth
long ll_beginyear
long ll_beginmonth_priorrow
long ll_beginyear_priorrow
long ll_enddate
long ll_endmonth
long ll_endyear
long ll_enteredmoney
long ll_enteredpercent
long ll_row
long ll_rowcount

// Sort the display so that we can verify that dates have no gaps.
This.SetSort ( 'beginyear D, beginmonth D' )
This.Sort ()

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount	
		
	// Grab the relevant date information for our checks.
	IF	ll_row > 1 THEN		
		ll_beginmonth_priorrow 	= This.GetItemNumber ( ll_row - 1, 'beginmonth' )
		ll_beginyear_priorrow 	= This.GetItemNumber ( ll_row - 1, 'beginyear' )
	END IF	
	ll_endyear 		= This.GetItemNumber ( ll_row, 'endyear' )
	ll_endmonth 	= This.GetItemNumber ( ll_row, 'endmonth' )
	ll_beginyear 	= This.GetItemNumber ( ll_row, 'beginyear' )
	ll_beginmonth 	= This.GetItemNumber ( ll_row, 'beginmonth' )
	
	// Update the computed database columns.	
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
		
	CHOOSE CASE le_itemstatus
		CASE NewModified!, DataModified!		
			// Get the fractional value (proportion) from the entered percents.	
			ll_enteredpercent 	= This.GetItemNumber ( ll_row, 'bonus2percentpercent' )
			IF	IsNull ( ll_enteredpercent ) THEN		
				MessageBox ( 'AMCP Factors', &
					'The Bonus 2 Percent is required.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'bonus2percent' )
				This.SetFocus ()
				Return -1
			END IF
			This.SetItem ( ll_row, 'bonus2percent', ( ll_enteredpercent / 100 ) )
			
			ll_enteredpercent 	= This.GetItemNumber ( ll_row, 'rmbonuspercentpercent' )
			IF	IsNull ( ll_enteredpercent ) THEN		
				MessageBox ( 'AMCP Factors', &
					'The Regional Manager Bonus Percent is required.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'rmbonuspercent' )
				This.SetFocus ()
				Return -1
			END IF
			This.SetItem ( ll_row, 'rmbonuspercent', ( ll_enteredpercent / 100 ) )
			
			// Because dollar amounts are an editmask, we have to do our own required column edit.
			// The edit mask prevents the entry of pennies.
			ll_enteredmoney 	= This.GetItemDecimal ( ll_row, 'bonuspayment1' )
			IF	IsNull ( ll_enteredmoney ) THEN		
				MessageBox ( 'AMCP Factors', &
					'Bonus Payment 1 is required.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'bonuspayment1' )
				This.SetFocus ()
				Return -1
			END IF
			ll_enteredmoney 	= This.GetItemDecimal ( ll_row, 'bonuspayment2' )
			IF	IsNull ( ll_enteredmoney ) THEN		
				MessageBox ( 'AMCP Factors', &
					'Bonus Payment 2 is required.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'bonuspayment2' )
				This.SetFocus ()
				Return -1
			END IF
			
			// Calculate the yearmonth.	
			This.SetItem ( ll_row, 'beginyearmonth', &
				( ll_beginyear * 100 ) + ll_beginmonth )			
			This.SetItem ( ll_row, 'endyearmonth', &
				( ll_endyear * 100 ) + ll_endmonth )
			
	END CHOOSE
	
	// Rule:  Beginning date must be less than or equal to ending date.
	ll_begindate = ( ll_beginyear * 100 ) + ll_beginmonth
	ll_enddate = ( ll_endyear * 100 ) + ll_endmonth
	IF	ll_begindate > ll_enddate THEN		
		MessageBox ( 'AMCP Factors', &
			'The Begin Year/Month cannot be after the End Year/Month.  Please correct.', Information!, OK! )
		This.SetRow ( ll_row )
		This.SetColumn ( 'endyear' )
		This.SetFocus ()
		Return -1
	END IF
	
	CHOOSE CASE ll_row
			
		CASE 1 
			// Rule: The first row must not expire.
			IF ll_endyear <> 2099 THEN
				MessageBox ( 'AMCP Factors', &
					'The most recent AMCP Factor must not expire.  Please set End Year to 2099. End Month to 12.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'endyear' )
				This.SetFocus ()
				Return -1
			END IF		
			
			IF ll_endmonth <> 12 THEN
				MessageBox ( 'AMCP Factors', &
					'The most recent AMCP Factor must not expire.  Please set End Month to 12.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'endmonth' )
				This.SetFocus ()
				Return -1
			END IF	

		CASE ELSE
			// For all rows other than the first one, we need to check for incorrect dates.			
			// Rule: The prior begin year/month must be one month from the current row's end year/month.
			// (Remember that we are sorted in descending order.)
			CHOOSE CASE ll_beginyear_priorrow
				CASE ll_endyear
					// Same year.
					CHOOSE CASE ll_beginmonth_priorrow
						CASE ll_endmonth + 1
							// Valid.  No gap.
						CASE ELSE
							// Error.
							// Years are OK.  Problem with months.
							MessageBox ( 'AMCP Factors', &
								'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
								+ ' Please fix.', &
								Information!, OK! )
							This.SetRow ( ll_row - 1 )
							This.SetColumn ( 'beginmonth' )
							This.SetFocus ()	
							Return -1
					END CHOOSE
				CASE ll_endyear + 1
					// Next year.  Months must be December and January.
					IF	ll_endmonth = 12 &
					AND ll_beginmonth_priorrow = 1 THEN
						// Got it right.
					ELSE
						// Problem with years.
						MessageBox ( 'AMCP Factors', &
							'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
							+ ' Please fix.', &
							Information!, OK! )
						This.SetRow ( ll_row - 1 )
						This.SetColumn ( 'beginmonth' )	
						This.SetFocus ()	
						Return -1						
					END IF
				CASE ELSE
					// Problem with years.
					MessageBox ( 'AMCP Factors', &
						'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
						+ ' Please fix.', &
						Information!, OK! )
					This.SetRow ( ll_row - 1 )
					This.SetColumn ( 'beginyear' )
					This.SetFocus ()	
					Return -1
			END CHOOSE

	END CHOOSE
			
NEXT

Return 1
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Be sure we have a valid month and year.
//						Check on entered percents and dollar amounts.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer ll_test

// We'll check required fields on Save.
IF	Len ( Trim ( data ) ) < 1 THEN
	Return 0
END IF

// Check field entered only. See pfc_validation for data relationship checks.
CHOOSE CASE dwo.name
		
	CASE 'beginyear','endyear'
		ll_test = Integer ( data )
		IF	ll_test > 2099 &
		OR ll_test < 2000 THEN
			MessageBox ( 'AMCP Factors', 'Year must be between 2000 and 2099.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'beginmonth', 'endmonth'
		ll_test = Integer ( data )
		IF	ll_test > 12 &
		OR ll_test < 1 THEN
			MessageBox ( 'AMCP Factors', 'Month must be between 1 and 12.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'rmbonuspercentpercent', 'bonus2percentpercent'
		ll_test = Integer ( data )
		IF	ll_test < 0 THEN
			MessageBox ( 'AMCP Factors', 'Bonus Percents must be a positive number.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF	
		
		
	CASE 'bonuspayment1', 'bonuspayment2'
		ll_test = Integer ( data )
		IF	ll_test < 0 THEN
			MessageBox ( 'AMCP Factors', 'Bonus Payments must be a positive number.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
END CHOOSE

Return 0

end event

event pfc_insertrow;call super::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	EXTEND the ancestor script to default the Begin Year/Month.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_beginmonth
long ll_beginyear
long ll_endmonth
long ll_endyear

// Skip errors.
IF	AncestorReturnValue < 1 THEN
	Return AncestorReturnValue
END IF

CHOOSE CASE	AncestorReturnValue 
	CASE This.RowCount ()
		// There is no prior row.  
		// Default Begin Year/Month to today.
		// Default End Year/Month to the maximum.
		ll_beginyear 	= Year ( Today () )
		ll_beginmonth 	= Month ( Today () )
		ll_endyear		= 2099
		ll_endmonth		= 12		
	CASE ELSE
		// There is a previous End Year/Month.
		// Set Begin Year/Month to previous end plus one month.
		ll_endyear	= This.GetItemNumber ( AncestorReturnValue + 1, 'endyear' )
		ll_endmonth	= This.GetItemNumber ( AncestorReturnValue + 1, 'endmonth' )
		IF	ll_endmonth = 12 THEN
			IF	ll_endyear = 2099 THEN
				ll_beginyear	= 2099
				ll_beginmonth	= 12
			ELSE
				ll_beginyear 	= ll_endyear + 1
				ll_beginmonth 	= 1
			END IF
		ELSE
			ll_beginyear	= ll_endyear
			ll_beginmonth 	= ll_endmonth + 1
		END IF
		// Set the End Year/Month depending on whether or not this is the first row.
		IF	AncestorReturnValue = 1 THEN
			// Set the never-expire default.
			ll_endyear		= 2099
			ll_endmonth		= 12
		ELSE
			// Set to the begin year/month.
			ll_endyear		= ll_beginyear
			ll_endmonth		= ll_beginmonth
		END IF
END CHOOSE

This.SetItem ( AncestorReturnValue, 'beginyear', ll_beginyear )
This.SetItem ( AncestorReturnValue, 'beginmonth', ll_beginmonth )
This.SetItem ( AncestorReturnValue, 'endyear', ll_endyear )
This.SetItem ( AncestorReturnValue, 'endmonth', ll_endmonth )
This.SetColumn ( 'beginyear' )
This.SetRow ( AncestorReturnValue )

Return AncestorReturnValue

end event

type st_amcp_factors_comment from statictext within w_amcp_account_manager
integer x = 2267
integer y = 300
integer width = 1065
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comment for selected Begin Year/Month"
boolean focusrectangle = false
end type

type dw_amcp_factors_update_comment from u_dw within w_amcp_account_manager
integer x = 2267
integer y = 364
integer width = 1161
integer height = 756
integer taborder = 10
string dataobject = "d_acmp_constants_comment"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We share data and so are not updateable.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.tag = ''
end event

event ue_dwnkey;call super::ue_dwnkey;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Control scrolling.
//
//	Arguments:  keycode		key
//					unsignedlog	keyflags
//
//	Returns:  long
//	 1 = Success
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_current_row

CHOOSE CASE key
	CASE	KeyPageUp!, &
			KeyPageDown!, &
			KeyEnd!, &
			KeyHome!, &
			KeyLeftArrow!, &
			KeyUpArrow!, &
			KeyRightArrow!, &
			KeyDownArrow!, &
			KeyTab!, &
			KeyEnter!
		
		// We cannot stop the action from being performed.
		// We can only scroll back to the current row.
		ll_current_row = This.GetRow ()
		This.Post ScrollToRow ( ll_current_row )
		
	CASE ELSE
END CHOOSE

Return 0
end event

type st_amcp_factors from statictext within w_amcp_account_manager
integer x = 50
integer y = 300
integer width = 1134
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "AMCP Factors by Begin Year/Month"
boolean focusrectangle = false
end type

type st_assign_offices_heading_1 from statictext within w_amcp_account_manager
integer x = 55
integer y = 300
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assign UNSIGNED Offices to the Selected Account Manager.  To move an Office, drag/drop highlighted row(s).  "
boolean focusrectangle = false
end type

type st_assign_offices_heading_2 from statictext within w_amcp_account_manager
integer x = 55
integer y = 352
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Click on column header to sort lists.  Use the View/Sort menu to sort by multiple columns."
boolean focusrectangle = false
end type

type st_unassigned_unsigned_offices from statictext within w_amcp_account_manager
integer x = 55
integer y = 428
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unassigned UNSIGNED Offices (no Account Manager and no Client)"
boolean focusrectangle = false
end type

type st_assigned_unsigned_offices from statictext within w_amcp_account_manager
integer x = 55
integer y = 1204
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assigned UNSIGNED Offices for the Selected Account Manager "
boolean focusrectangle = false
end type

type dw_client_signed_office_history from u_dw within w_amcp_account_manager
string tag = "am_3"
integer x = 59
integer y = 1152
integer width = 3538
integer height = 676
integer taborder = 20
string dataobject = "d_offices_assigned_signed"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// We are setting the sort here because this datawindow object is used in many places.
This.SetSort ( 'clntfranchise_begineffdate D, clntfranchise_endeffdate D, office_franchisenum A' )
This.Sort ()

This.tag = 'am_client'


end event

type dw_unsigned_office_history from u_dw within w_amcp_account_manager
string tag = "am_6"
integer x = 59
integer y = 364
integer width = 3538
integer height = 704
integer taborder = 20
string dataobject = "d_offices_assigned_unsigned_history"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// We are setting the sort here because this datawindow object is used in many places.
This.SetSort ( 'officeacctmanager_begineffdate D, officeacctmanager_endeffdate D, office_franchisenum A' )
This.Sort ()

This.tag = 'am_office_history'

end event

type st_client_signed_office_history from statictext within w_amcp_account_manager
integer x = 59
integer y = 1092
integer width = 3346
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assigned Client (SIGNED Office) History"
boolean focusrectangle = false
end type

type st_unsigned_office_history from statictext within w_amcp_account_manager
integer x = 59
integer y = 300
integer width = 3346
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assigned UNSIGNED Office History"
boolean focusrectangle = false
end type

type st_account_manager_search_critieria from statictext within w_amcp_account_manager
integer x = 59
integer y = 300
integer width = 3387
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter ID, Area or Last Name for a list of Account Managers.  Case sensitive. Partial entries supported. No wild card (~'%~') needed."
boolean focusrectangle = false
end type

type dw_account_manager_search_criteria from u_dw within w_amcp_account_manager
event type integer ue_search ( )
event type integer ue_clearcriteria ( )
integer x = 59
integer y = 364
integer width = 3387
integer height = 212
integer taborder = 10
string dataobject = "d_search_accountmanager_criteria"
boolean vscrollbar = false
end type

event ue_search;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Capture user entered critieria.  Retrieve list.
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

long ll_am_persidnum
long ll_return

string ls_am_lastname
string ls_rm_lastname
string ls_areadesc

window lw_frame

dw_account_manager_list.Reset ()
dw_account_manager_list.SetFilter ( '' )
dw_account_manager_list.Filter ()

IF	This.RowCount () < 1 THEN
	Return -1
END IF

ll_am_persidnum = This.GetItemNumber ( 1, 'am_persidnum' )
IF	IsNull ( ll_am_persidnum ) THEN
	// Use other criteria. See below.
	dw_account_manager_list.dataobject = 'd_search_accountmanager'
	dw_account_manager_list.of_settransobject ( SQLCA )
ELSE
	// Use only the entered Account Manager ID.
	dw_account_manager_list.dataobject = 'd_search_accountmanager_persidnum'
	dw_account_manager_list.of_settransobject ( SQLCA )
	ll_return =	dw_account_manager_list.Retrieve ( ll_am_persidnum )
	CHOOSE CASE ll_return
		CASE is < 0
			//?? Database error.
			Return -1
		CASE 0
			lw_frame = gnv_app.of_getframe ()
			lw_frame.SetMicroHelp ( 'No Account Manager with Account Manager ID = ' &
				+ String ( ll_am_persidnum) + '.' )
			Return 0
		CASE ELSE
			Return 1
	END CHOOSE
END IF

ls_am_lastname = This.GetItemString ( 1, 'am_perslastname' )
IF	IsNull ( ls_am_lastname ) &
OR	Len ( Trim ( ls_am_lastname ) ) < 1 THEN
	ls_am_lastname = '%'
ELSE
	ls_am_lastname = Trim ( ls_am_lastname ) + '%'
END IF

ls_rm_lastname = This.GetItemString ( 1, 'rm_perslastname' )
IF	IsNull ( ls_rm_lastname ) &
OR	Len ( Trim ( ls_rm_lastname ) ) < 1 THEN
	ls_rm_lastname = '%'
ELSE
	ls_rm_lastname = Trim ( ls_rm_lastname ) + '%'
END IF

ls_areadesc = This.GetItemString ( 1, 'area_areadesc' )
IF	IsNull ( ls_areadesc ) &
OR	Len ( Trim ( ls_areadesc ) ) < 1 THEN
	ls_areadesc = '%'
ELSE
	ls_areadesc = Trim ( ls_areadesc ) + '%'
END IF

// Require more than one criteria.
IF	ls_areadesc = '%' &
	AND ls_am_lastname = '%' &
	AND ls_rm_lastname = '%' THEN
	MessageBox ( 'AMCP Account Manager', 'Please enter at least one search criteria.' )
	Return -1
END IF

ll_return =	dw_account_manager_list.Retrieve ( ls_am_lastname, ls_areadesc, ls_rm_lastname )

CHOOSE CASE ll_return
	CASE is < 0
		//?? Database error.
		Return -1
	CASE 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Account Managers for your criteria.' )
		Return 0
	CASE ELSE
END CHOOSE
	

Return 1
end event

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Triggered by Clear Criteria menu.  Reset/insert a row.
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

This.Reset ()

This.InsertRow ( 0 )

Return 1
end event

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  React to click of Search button.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

CHOOSE CASE dwo.name
		
	CASE 'b_search'
		// Trigger the event to retrieve Account Manager list.
		IF	This.AcceptText () < 0 THEN
		ELSE
			This.Event ue_search ()
		END IF
		
	CASE ELSE
		
END CHOOSE

Return 0
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Not updateable.  Insert a row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.Event ue_clearcriteria ()

This.tag = ''
end event

type st_account_manager_list from statictext within w_amcp_account_manager
integer x = 59
integer y = 604
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a single Acccount Manager on the List to view/update.  The Selected Account Manager Field will prefill and tabs will enable."
boolean focusrectangle = false
end type

type dw_account_manager_list from u_dw within w_amcp_account_manager
integer x = 59
integer y = 668
integer width = 3387
integer height = 1148
integer taborder = 10
string dataobject = "d_search_accountmanager"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

This.of_setrowselect ( True )

This.tag = ''

end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the clicked row is  selected (highlighted), then
//						copy the row to the Selected Account Manager header
//						and enable tabs.
//
//						If the clicked row is NOT selected, then reset the
//						Selected Account Manager header and disable tabs.
//
//						Note: The ancestor event selects the row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	This.IsSelected ( row ) THEN
	dw_selected_account_manager.Reset ()
	This.RowsCopy ( row, row, Primary!, dw_selected_account_manager, 1, Primary! )
	tab_1.Event ue_enabletabpages ()
ELSE	
	dw_selected_account_manager.Reset ()
	dw_selected_account_manager.InsertRow ( 1 )
	tab_1.Event ue_disabletabpages ()
END IF

Return AncestorReturnValue


end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Force the user to select a row.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.SelectRow ( 0, False )
end event

type dw_unassigned_unsigned_office_list from u_dw within w_amcp_account_manager
event ue_mousemove pbm_mousemove
event type long ue_unassignoffices ( )
string tag = "unassigned"
integer x = 55
integer y = 492
integer width = 3552
integer height = 676
integer taborder = 20
string dragicon = "DataWindow5!"
string dataobject = "d_offices_unassigned_unsigned"
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

event ue_unassignoffices;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Unassign an Assigned UNSIGNED Office.
//
//						MOVE all selected rows from the Assigned UNSIGNED
// 					datawindow to this control, fill in the EndEffDate
//						OfficeAcctManager field, and save.
//
//
//	Arguments:  none
//
//	Returns:  long
//	 >0 	= Count of unassigned rows.
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

datetime ldt_begineffdate
datetime ldt_endeffdate
	
dwitemstatus le_itemstatus

long ll_persidnum
long ll_row
long ll_rowsdiscard[]
long ll_rowsdiscardcount
long ll_selectedrow

string ls_filterstring

// Be sure there is at least one row selected.
ll_selectedrow = dw_assigned_unsigned_office_list.GetSelectedRow ( 0 )
IF	ll_selectedrow <= 0 THEN
	MessageBox ( 'Assign Offices', 'To assign an UNSIGNED Office, a row must be selected.', Information!, OK! )
	Return -1
END IF

// Be sure we have a Selected Account Manager's PersIDNum.
IF	dw_selected_account_manager.RowCount () <> 1 THEN
	MessageBox ( 'Assign Offices', 'Programmer Error: ' &
		+ This.Title + ' dw_assign_unsigned_office_list::ue_assignoffices.' &
		+ ' Cannot find Selected Account Manager PersIDNum' )
	Return -1
END IF
ll_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

// Default the End Effective Date to last night.
ldt_endeffdate		= DateTime ( Today(), Time ( '00:00:00' ) )

// Make our activity invisible to the user.
dw_assigned_unsigned_office_list.SetRedraw ( False )

// Undo the filter so we don't change buffers when we set the EndEffDate.
ls_filterstring = dw_assigned_unsigned_office_list.object.datawindow.table.filter
dw_assigned_unsigned_office_list.SetFilter ( '' )
dw_assigned_unsigned_office_list.Filter ()

// Finally, COPY the rows.
DO WHILE ll_selectedrow > 0

	dw_assigned_unsigned_office_list.SetItem ( ll_selectedrow, &
		'officeacctmanager_endeffdate', ldt_endeffdate )
		
	// We only copy the row.  The Unassigned row must stay in the unassigned
	// control so we can find it again if we need to reassign it.
	dw_assigned_unsigned_office_list.RowsCopy ( ll_selectedrow, ll_selectedrow, Primary!, &
		This, 1, Primary! )
		
	// Be sure that only the dw_assigned_unsigned_office_list updates.
	This.SetItemStatus ( 1, 0, Primary!, DataModified! )
	le_itemstatus = This.GetItemStatus ( 1, 0, Primary! )
	This.SetItemStatus ( 1, 0, Primary!, NotModified! )
	le_itemstatus = This.GetItemStatus ( 1, 0, Primary! )
	
	// Get the next selected row.
	ll_selectedrow = dw_assigned_unsigned_office_list.GetSelectedRow ( ll_selectedrow )
	
LOOP

// Tidy up.
dw_assigned_unsigned_office_list.SelectRow ( 0, False )

dw_assigned_unsigned_office_list.SetFilter ( ls_filterstring )
dw_assigned_unsigned_office_list.Filter ()

dw_assigned_unsigned_office_list.Sort ()
This.Sort ()

dw_assigned_unsigned_office_list.SetRedraw ( True )

// Save.
Parent.Event pfe_save ()

Return 1
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Set up the standard list stuff.
//						We are going to drag/drop so multirow selection.
//						We will update the OfficeAcctManager table.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = True

This.of_SetSort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_SetFilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// Extended row selection.
This.of_SetRowSelect ( True )
This.inv_rowselect.of_setstyle ( 2 )

// Drag/drop logic needs to reliably recognize this control.
This.Tag = 'unassigned'

// Save the DragIcon.
Parent.is_dragicon_unassigned = This.DragIcon
end event

event dragdrop;call super::dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the Assigned UNSIGNED list is dropped on this
//						control, then we need to set the EndEffDate.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'am_assigned' THEN
			// Stop the dragging.
			ldw_dropped.Drag ( End! )
			// Trigger the assign offices event.
			This.Event ue_unassignoffices ()
			ldw_dropped.DragIcon = Parent.is_dragicon_assigned
		END IF
END CHOOSE

Return 0
end event

event dragenter;call super::dragenter;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the Assigned UNSIGNED list is dragged into this
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

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'am_assigned' THEN
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
//						If the Assigned UNSIGNED list is dragged out of this
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

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'am_assigned' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = Parent.is_dragicon_assigned
		END IF
END CHOOSE

Return 0
end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Force the user to select a row.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.SelectRow ( 0, False )
end event

type dw_assigned_unsigned_office_list from u_dw within w_amcp_account_manager
event type long ue_assignoffices ( )
event ue_mousemove pbm_mousemove
string tag = "am_2"
integer x = 55
integer y = 1264
integer width = 3552
integer height = 572
integer taborder = 10
string dragicon = "APPTL.ICO"
string dataobject = "d_offices_assigned_unsigned"
boolean hsplitscroll = true
end type

event ue_assignoffices;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Assign and Unassigned UNSIGNED Office to the
//						Selected Account Manager.
//
//						MOVE all selected rows from the Unassigned UNSIGNED
// 					datawindow to this control, fill in the 
//						OfficeAcctManager fields, and save.
//
//						The OfficeAcctManager Begin and End dates will
//						default.  Users may want to modify them later.
//
//	Arguments:  none
//
//	Returns:  long
//	 >0 	= Count of assigned rows.
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

datetime ldt_begineffdate
datetime ldt_endeffdate
datetime ldt_assignbegineffdate
datetime ldt_assignendeffdate

long ll_idx
long ll_officeidnum[]
long ll_persidnum
long ll_row
long ll_rowcount
long ll_rowcountmgr
long ll_rowfound
long ll_rowsdiscard[]
long ll_rowsdiscardcount
long ll_selectedrow

string ls_endeffdate
string ls_filterstring
string ls_findstring
string ls_franchisenum[]

// Be sure there is at least one row selected.
ll_selectedrow = dw_unassigned_unsigned_office_list.GetSelectedRow ( 0 )
IF	ll_selectedrow <= 0 THEN
	MessageBox ( 'Assign Offices', 'To assign an UNSIGNED Office, a row must be selected.', Information!, OK! )
	Return -1
END IF

// Be sure we have a Selected Account Manager's PersIDNum.
IF	dw_selected_account_manager.RowCount () <> 1 THEN
	MessageBox ( 'Assign Offices', 'Programmer Error: ' &
		+ This.Title + ' dw_assign_unsigned_office_list::ue_assignoffices.' &
		+ ' Cannot find Selected Account Manager PersIDNum' )
	Return -1
END IF
ll_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

// Default the dates.
ldt_begineffdate 	= DateTime ( Today(), Time ( '00:00:00' ) )
ldt_endeffdate		= DateTime ( Date ( '12/31/2099'), Time ( '00:00:00' ) )
ls_endeffdate 		= '12/31/2099'

// Finally, MOVE the rows.
This.SetRedraw ( False )
ls_filterstring = This.object.datawindow.table.filter
This.SetFilter ( '' )
This.Filter ()

// Build a list of selected Office IDs and Franchise Numbers.
DO WHILE ll_selectedrow > 0
	ll_idx = ll_idx + 1
	ll_officeidnum[ll_idx]	= &
		dw_unassigned_unsigned_office_list.GetItemNumber ( ll_selectedrow, 'office_officeidnum' )
	ls_franchisenum[ll_idx] = &
		dw_unassigned_unsigned_office_list.GetItemString ( ll_selectedrow, 'office_franchisenum' )
	ll_selectedrow 			= &
		dw_unassigned_unsigned_office_list.GetSelectedRow ( ll_selectedrow )
LOOP
ids_clientfranchise.Reset ()
ll_rowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )

ids_officeacctmanager.Reset ()
ll_rowcountmgr = ids_officeacctmanager.Retrieve ( ll_officeidnum )

// Start over.
ll_selectedrow = dw_unassigned_unsigned_office_list.GetSelectedRow ( 0 )


DO WHILE ll_selectedrow > 0
	
	// Default the assignment dates.
	
	// Check for any other saved OfficeAcctManager rows.
	// Find any OfficeAcctManager row for this OfficeIDNum where the 
	// default BeginEffDate falls between an OfficeAcctManager
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
		+ ' and Date ( endeffdate ) > ' &
		+ ' Date ( "' &
		+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) <= ' &
		+ ' Date ( "' &
		+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
		+ ' ")' 
	ll_rowfound = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_rowfound > 0 THEN
		ldt_assignbegineffdate = ids_officeacctmanager.GetItemDateTime ( ll_rowfound, 'endeffdate' )
	ELSE
		ldt_assignbegineffdate = ldt_begineffdate
	END IF
	
	// Check for Offices about to be Assigned.
	// Find any OfficeAcctManager row for this OfficeIDNum where the 
	// default EndEffDate falls between an OfficeAcctManager
	// BeginEffDate and EndEffDate.
	// Note: We are using a string for the end effective date.  Otherwise PB's string
	// function turns 2099 into 1999.
	ls_findstring = &
		'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
		+ '" and Date ( endeffdate ) >= ' &
		+ ' Date ( "' &
		+ ls_endeffdate &
		+ ' ")' &
		+ ' and Date ( begineffdate ) < ' &
		+ ' Date ( "' &
		+ ls_endeffdate &
		+ ' ")'
	ll_rowfound = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_rowfound > 0 THEN
		ldt_assignendeffdate = ids_officeacctmanager.GetItemDateTime ( ll_rowfound, 'begineffdate' )
	ELSE		
		ldt_assignendeffdate = ldt_endeffdate
	END IF
	
	// Check for recently UNSIGNED Offices.
	// Find any ClntFranchise row for this FranchiseNum where the 
	// default BeginEffDate falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) > ' &
		+ ' Date ( "' &
		+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) <= ' &
		+ ' Date ( "' &
		+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
		+ ' ")' 
	ll_rowfound = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_rowfound > 0 THEN
		ldt_assignbegineffdate = ids_clientfranchise.GetItemDateTime ( ll_rowfound, 'endeffdate' )
	ELSE
		ldt_assignbegineffdate = ldt_begineffdate
	END IF
	
	// Check for Offices about to be SIGNED.
	// Find any ClntFranchise row for this FranchiseNum where the 
	// default EndEffDate falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	// Note: We are using a string for the end effective date.  Otherwise PB's string
	// function turns 2099 into 1999.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) >= ' &
		+ ' Date ( "' &
		+ ls_endeffdate &
		+ ' ")' &
		+ ' and Date ( begineffdate ) < ' &
		+ ' Date ( "' &
		+ ls_endeffdate &
		+ ' ")'
	ll_rowfound = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_rowfound > 0 THEN
		ldt_assignendeffdate = ids_clientfranchise.GetItemDateTime ( ll_rowfound, 'begineffdate' )
	ELSE		
		ldt_assignendeffdate = ldt_endeffdate
	END IF
	
	// Check to see if we already have a row with that date.
	ls_findstring = "String ( Date ( officeacctmanager_begineffdate ), 'mm/dd/yyyy' ) = '" &
		+ String ( Date ( ldt_assignbegineffdate ), 'mm/dd/yyyy' ) + "'" &
		+ " and officeacctmanager_officeidnum=" &
		+ String ( dw_unassigned_unsigned_office_list.GetItemNumber ( ll_selectedrow, 'office_officeidnum' ) )
	ll_row = This.Find ( ls_findstring, 1, This.RowCount () )
	IF	ll_row > 0 THEN		
		This.SetItem ( 1, 'officeacctmanager_endeffdate', ldt_assignendeffdate )
	ELSE
	
		// We should end up with a "New" row in row 1.
		dw_unassigned_unsigned_office_list.RowsCopy ( ll_selectedrow, ll_selectedrow, Primary!, &
			This, 1, Primary! )
			
		// Populate the OfficeAcctManager fields.	This makes the row "NewModified".
		This.SetItem ( 1, 'officeacctmanager_persidnum', ll_persidnum )
		This.SetItem ( 1, 'officeacctmanager_begineffdate', ldt_assignbegineffdate )
		This.SetItem ( 1, 'officeacctmanager_endeffdate', ldt_assignendeffdate )
		This.SetItem ( 1, 'officeacctmanager_officeidnum', This.GetItemNumber ( 1, 'office_officeidnum' ) )
		
	END IF
	
	// Keep track of the rows to discard.
	ll_rowsdiscardcount = ll_rowsdiscardcount + 1
	ll_rowsdiscard[ll_rowsdiscardcount] = ll_selectedrow
	
	// Get the next selected row.
	ll_selectedrow = dw_unassigned_unsigned_office_list.GetSelectedRow ( ll_selectedrow )
	
LOOP

// Now discard the selected rows in the unassigned control. 
// To avoid wierd stuff, start from the bottom up.
FOR ll_row = ll_rowsdiscardcount TO 1 STEP -1
	
	dw_unassigned_unsigned_office_list.RowsDiscard ( ll_rowsdiscard[ll_row], ll_rowsdiscard[ll_row],Primary! )
	
NEXT

// Tidy up.
dw_unassigned_unsigned_office_list.SelectRow ( 0, False )
This.SetFilter ( ls_filterstring )
This.Filter ()

This.Sort ()

This.SetRedraw ( True )

// Save.
Parent.Event pfe_save ()


Return 0
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
//	Description:	Set up the standard list stuff.
//						We are going to drag/drop so multirow selection.
//						We will update the OfficeAcctManager table.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Date ld_endeffdate
string ls_filterstring

This.ib_isupdateable = True

This.of_SetSort ( True )
This.inv_sort.of_setcolumnheader ( True )

// Extended row selection.
This.of_SetRowSelect ( True )

// Set the filter so we only display rows that are currently assigned.
// We need the filter buffer to check conflicting dates.
// We are setting the filter here because this datawindow object is used in many places.
// Show all offices with dates that can be modified.  I.e. with end date in the current
// month.
ld_endeffdate = Date ( String ( Month ( Today () ) ) + '/1/' + String ( Year ( Today () ) ) )
ls_filterstring = &
	"Date ( OfficeAcctManager_EndEffDate ) >= Date ( '" + String ( ld_endeffdate  ) + "')"	
This.SetFilter ( ls_filterstring )
This.Filter ()

This.of_SetDropDownCalendar ( True )
This.iuo_calendar.of_Register ( 'officeacctmanager_begineffdate', &
  	This.iuo_calendar.DDLB_WITHARROW )
This.iuo_calendar.of_Register ( 'officeacctmanager_endeffdate', &
	This.iuo_calendar.DDLB_WITHARROW )

// Drag/drop logic needs to reliably recognize this control.
This.Tag = 'am_assigned'

// Save the DragIcon.
Parent.is_dragicon_assigned = This.DragIcon


end event

event dragdrop;call super::dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the Unassigned UNSIGNED list is dropped on this
//						control, then we need to assign the currently
//						selected account manager.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Datawindow	ldw_dropped

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'unassigned' THEN
			// Stop the dragging.
			ldw_dropped.Drag ( End! )
			// Trigger the assign offices event.
			This.Event ue_assignoffices ()
			ldw_dropped.DragIcon = Parent.is_dragicon_unassigned
		END IF
END CHOOSE

Return 0
end event

event dragenter;call super::dragenter;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Drag-drop logic.
//
//						If the Unassigned UNSIGNED list is dragged into this
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

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'unassigned' THEN
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
//						If the Unassigned UNSIGNED list is dragged out of this
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

// Determine if the dragged object is the Unassigned UNSIGNED list.
CHOOSE CASE source.TypeOf ()
	CASE Datawindow!
		ldw_dropped = source
		IF	Lower ( ldw_dropped.tag ) = 'unassigned' THEN
			// Swap the icon.
			ldw_dropped.DragIcon = Parent.is_dragicon_unassigned
		END IF
END CHOOSE

Return 0
end event

event retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Force the user to select a row.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.SelectRow ( 0, False )
end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the USER has MODIFIED a OfficeAcctManager.BeginEffDate
//						or EndEffDate, we need to be sure that the user hasn't
//						stepped on dates when the Office was SIGNED to a Client.
//						I.e. there is no overlap with ClientFranchise.BeginEffDate
//						and EndEffDate for this Office.
//
//						If the user simply added a row from the dw_unassigned_unsigned_office_list,
//						we have defaulted the dates and updated OfficeAcctManager
//						already.  We save immediately on an add so the user
//						does not have a chance to mess around with the dates
//						while the row is new.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

date ld_begineffdate
date ld_officeacctmanager_begineffdate[]
date ld_original_begineffdate[]
date ld_endeffdate
date ld_officeacctmanager_endeffdate[]
date ld_original_endeffdate[]

datetime ldt_temp
datetime ldt_tempbegin
datetime ldt_tempend

dwitemstatus le_dwitemstatus
dwitemstatus le_dwitemstatus_row

long	ll_idx
long	ll_max
long 	ll_modifiedrow[]
long	ll_officeidnum[]
long 	ll_row
long 	ll_rowcount

string ls_findstring
string ls_franchisenum[]

// Reset the datastore.
ids_clientfranchise.Reset ()

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// We only want to check dates on changed rows.  NewModified rows are
	// saved using default dates.
	le_dwitemstatus_row = This.GetItemStatus ( ll_row, 0, Primary! )
	CHOOSE CASE le_dwitemstatus_row
		CASE DataModified!
		CASE ELSE
			Continue
	END CHOOSE
	// Something has changed.
	ld_begineffdate 	= Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_begineffdate' ) )
	ld_endeffdate		= Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_endeffdate' ) )
	
	// Rule: Both Start and End dates are required.
	IF	IsNull ( ld_begineffdate ) &
	OR IsNull ( ld_endeffdate ) THEN
		MessageBox ( 'Assigned Offices', &
			'Both Start and End Effective dates are required.  Please correct.',&
			Information!, OK! )
		This.SetFocus ()	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_begineffdate' )
		Return -1
	END IF
	
	// Rule: Both Start date cannot be later than End date.
	IF	ld_begineffdate > ld_endeffdate THEN
		MessageBox ( 'Assigned Offices', &
			'Assignment Start date cannot be later than Assignment End date.  Please correct.',&
			Information!, OK! )
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_begineffdate' )
		Return -1
	END IF	
	
	// Rule: Both Start and End date cannot be earlier than the current Year/Month.
	//			We check modified to be sure we are not editing a date entered in a prior month.
	le_dwitemstatus =	This.GetItemStatus ( ll_row, 'officeacctmanager_begineffdate', Primary! )	
	IF	( Year ( ld_begineffdate ) * 100 ) + Month ( ld_begineffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		IF	ld_begineffdate = &
			Date ( This.GetItemDateTime ( ll_row, &
			'officeacctmanager_begineffdate', Primary!, True ) ) THEN
		ELSE	
			MessageBox ( 'Assigned Offices', &
				'Assignment Start date cannot be earlier than the current Year/Month.  Please correct.',&
				Information!, OK! )
			This.SetItem ( ll_row, 'cc_saved', 0 )	
			SetRow ( ll_row )
			ScrollToRow ( ll_row )
			SetColumn ( 'officeacctmanager_begineffdate' )
			Return -1
		END IF
	END IF
	le_dwitemstatus =	This.GetItemStatus ( ll_row, 'officeacctmanager_endeffdate', Primary! )	
	IF	( Year ( ld_endeffdate ) * 100 ) + Month ( ld_endeffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		MessageBox ( 'Assigned Offices', &
			'Assignment End date cannot be earlier than the current Year/Month.  Please correct.',&
			Information!, OK! )
		This.SetItem ( ll_row, 'cc_saved', 0 )	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_endeffdate' )
		Return -1
	END IF
	
	// Dates are valid.  Add this Office to the array of ClientFranchise and 
	// OfficeAcctManager assignment dates to be verified/modified.
	ll_max = ll_max + 1
	ll_modifiedrow[ll_max] 							= ll_row
	ld_officeacctmanager_begineffdate[ll_max] = ld_begineffdate
	ld_officeacctmanager_endeffdate[ll_max] 	= ld_endeffdate
	ls_franchisenum[ll_max] 			= This.GetItemString ( ll_row, 'office_franchisenum' )
	ll_officeidnum[ll_max]				= This.GetItemNumber ( ll_row, 'office_officeidnum' )
	ld_original_begineffdate[ll_max] = &
		Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_begineffdate', Primary!, True ) )
	ld_original_endeffdate[ll_max] = &
		Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_endeffdate', Primary!, True ) )
	
NEXT

// If we got here because a row was added, we do NOT want to reset the
// Office List.  We only want to go forward if the user actually modified
// a date on a previously saved row.
IF	ll_max < 1 THEN
	Return 1
END IF

// OK. Check for conflicting Assigned UNSIGNED Office dates.
// Retrieve the OfficeAcctManager table in the invisible datawindow control.
ll_rowcount = ids_officeacctmanager.Retrieve ( ll_officeidnum )

// Remember that the Offices we are looking for may NOT have been assigned to an
// Account Manager.
IF	ll_rowcount > 0 THEN
	FOR ll_idx = 1 TO ll_max
		// Find any OfficeAcctManager row for this FranchiseNum where the 
		// EndEffDate on the modified row is within an OfficeAcctManager
		// BeginEffDate/EndEffDate AND IS NOT THE ROW WE ARE VALIDATING.
		ls_findstring = &
			'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
			+ ' and Date ( begineffdate ) < ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( endeffdate ) >= ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &			
			+ ' and ' &
			+ ' Date ( endeffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( begineffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")'
			
		ll_row = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
		IF	ll_row > 0 THEN
			// We have a row with an inappropriate end date.  We need to display a message.
			ldt_tempbegin 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'begineffdate' )
			ldt_tempend 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'endeffdate' )
			MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
				+ ' Assignment End date cannot be within the date range ' &
				+ String ( ldt_tempbegin, 'mm/dd/yyyy' ) &
				+ ' thru ' &
				+ String ( ldt_tempend, 'mm/dd/yyyy' ) &
				+ '. This Office has another Account Manager Assignment.  Please correct.', &
				Information!, OK! )
			This.ScrollToRow ( ll_modifiedrow[ll_idx] )
			This.SetRow ( ll_modifiedrow[ll_idx] )
			This.SetColumn ( 'officeacctmanager_endeffdate' )
			This.SetFocus ()
			Return -1
		END IF	
		
		// Find any OfficeAcctManager row for this FranchiseNum where the 
		// BeginEffDate that the user entered is earlier than an OfficeAcctManager
		// EndEffDate AND IS NOT THE ROW WE ARE VALIDATING.
		ls_findstring = &
			'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
			+ ' and Date ( endeffdate ) > ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_begineffdate[ll_idx] ) &
			+ ' ")' &			
			+ ' and Date ( begineffdate ) <= ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_begineffdate[ll_idx] ) &
			+ ' ")' &
			+ ' and ( ' &
			+ ' Date ( endeffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( begineffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ") )'
		ll_row = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
		IF	ll_row > 0 THEN
			// We have a row with an inappropriate begin date.  We need to display a message.
			ldt_tempbegin 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'begineffdate' )
			ldt_tempend 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'endeffdate' )
			MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
				+ ' Assignment Begin date cannot be within the date range ' &
				+ String ( ldt_tempbegin, 'mm/dd/yyyy' ) &
				+ ' thru ' &
				+ String ( ldt_tempend, 'mm/dd/yyyy' ) &
				+ '. This Office has another Account Manager Assignment.  Please correct.',&
				Information!, OK! )
			This.ScrollToRow ( ll_modifiedrow[ll_idx] )
			This.SetRow ( ll_modifiedrow[ll_idx] )
			This.SetColumn ( 'officeacctmanager_begineffdate' )
			This.SetFocus ()
			Return -1
		END IF	
	NEXT
END IF

// OK. Check for conflicting SIGNED Office dates.
// Retrieve the ClntFranchise table in the invisible datawindow control.
ll_rowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )

// Remember that the Offices we are looking for may NOT have been SIGNED to any
// Client.
IF	ll_rowcount > 0 THEN
ELSE
	Return 1
END IF

FOR ll_idx = 1 TO ll_max
	// Find any ClntFranchise row for this FranchiseNum where the 
	// BeginEffDate that the user entered falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) > ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) <= ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
		+ ' ")' 
	ll_row = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_row > 0 THEN
		// We have a row with an inappropriate end date.  We need to display a message.
		ldt_temp = ids_clientfranchise.GetItemDateTime ( ll_row, 'endeffdate' )
		MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
			+ ' Assignment Start date cannot be earlier than ' &
			+ String ( ldt_temp, 'mm/dd/yyyy' ) &
			+ '. This Office was previously SIGNED.  Please correct.',&
			Information!, OK! )
		This.ScrollToRow ( ll_modifiedrow[ll_idx] )
		This.SetRow ( ll_modifiedrow[ll_idx] )
		This.SetColumn ( 'officeacctmanager_begineffdate' )
		This.SetFocus ()
		Return -1
	END IF	
	
	// Find any ClntFranchise row for this FranchiseNum where the 
	// EndEffDate that the user entered falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) >= ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_endeffdate[ll_idx] ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) < ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_endeffdate[ll_idx] ) &
		+ ' ")'
	ll_row = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_row > 0 THEN
		// We have a row with an inappropriate end date.  We need to display a message.
		ldt_temp = ids_clientfranchise.GetItemDateTime ( ll_row, 'begineffdate' )
		MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
			+ ' Assignment End date cannot be later than ' &
			+ String ( ldt_temp, 'mm/dd/yyyy' ) &
			+ '. This Office is set up to be SIGNED.  Please correct.',&
			Information!, OK! )
		This.ScrollToRow ( ll_modifiedrow[ll_idx] )
		This.SetRow ( ll_modifiedrow[ll_idx] )
		This.SetColumn ( 'officeacctmanager_endeffdate' )
		This.SetFocus ()
		Return -1
	END IF	
NEXT
	
Return 1
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Users can only modify dates in the current month.
//						However, if they set the unprotected date to a prior
//						month, they will be unable to fix it without clicking
//						save.  So we will reset the cc_saved flag to zero
//						when they change a date.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

CHOOSE CASE dwo.name
	CASE 'officeacctmanager_begineffdate', 'officeacctmanager_endeffdate'
		This.SetItem ( row, 'cc_saved', 0 )
END CHOOSE

Return 0
end event

type dw_override_entry from u_dw within w_amcp_account_manager
event type long ue_recalculate_ytd ( )
string tag = "am_4"
integer x = 37
integer y = 316
integer width = 3566
integer height = 752
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_accountmanager_amcp_override"
end type

event ue_recalculate_ytd;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Recalculate the YTD values.
//						Note: We could use a computed column on the dwo except that 
//								we are sorted in the wrong order.
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

long ll_bcs
long ll_bcsytd
long ll_bcs3
long ll_bcsytd3
long ll_bcs6
long ll_bcsytd6
long ll_bcs9
long ll_bcsytd9
long ll_bcs12
long ll_bcsytd12
long ll_column
long ll_currentmonth
long ll_currentyear
long ll_leadscreated
long ll_leadscreatedytd
long ll_loansclosed
long ll_loansclosedytd
long ll_month
long ll_row
long ll_rowcount

string ls_findstring 

// Save enough information to find the current row.
ll_row				= GetRow ()
IF	ll_row < 1 THEN
	Return 1
END IF
ll_currentmonth 	= This.GetItemNumber ( ll_row, 'month' )
ll_currentyear 	= This.GetItemNumber ( ll_row, 'year' )

ll_column	= This.GetColumn ()

// Be sure we are sorted in the right order.
This.Sort ()

ll_rowcount = This.RowCount ()

// Loop from last to first row.
FOR ll_row = ll_rowcount to 1 Step -1
	ll_month 			= This.GetItemNumber ( ll_row, 'month' )
	ll_bcs				= This.GetItemNumber ( ll_row, 'bcs' )
	ll_leadscreated 	= This.GetItemNumber ( ll_row, 'leadscreated' )
	ll_loansclosed		= This.GetItemNumber ( ll_row, 'loansclosed' )
	ll_bcs3				= This.GetItemNumber ( ll_row, 'avgbcs3mth' )
	ll_bcs6				= This.GetItemNumber ( ll_row, 'avgbcs6mth' )
	ll_bcs9				= This.GetItemNumber ( ll_row, 'avgbcs9mth' )
	ll_bcs12				= This.GetItemNumber ( ll_row, 'avgbcs12mth' )
	
	// Be careful of null values.
	IF	IsNull ( ll_bcs ) THEN
		ll_bcs = 0
	END IF
	IF	IsNull ( ll_bcs3 ) THEN
		ll_bcs3 = 0
	END IF
	IF	IsNull ( ll_bcs6 ) THEN
		ll_bcs6 = 0
	END IF
	IF	IsNull ( ll_bcs9 ) THEN
		ll_bcs9 = 0
	END IF
	IF	IsNull ( ll_bcs12 ) THEN
		ll_bcs12 = 0
	END IF
	IF	IsNull ( ll_leadscreated ) THEN
		ll_leadscreated = 0
	END IF
	IF	IsNull ( ll_loansclosed ) THEN
		ll_loansclosed = 0
	END IF
	
	// Restart the accumulation on the first month of a year.
	IF	ll_month = 1 THEN
		ll_bcsytd 				= ll_bcs
		ll_leadscreatedytd 	= ll_leadscreated
		ll_loansclosedytd		= ll_loansclosed
		ll_bcsytd3 				= ll_bcs3
		ll_bcsytd6 				= ll_bcs6
		ll_bcsytd9				= ll_bcs9
		ll_bcsytd12 			= ll_bcs12
	ELSE
		ll_bcsytd 				= ll_bcsytd + ll_bcs
		ll_bcsytd3 				= ll_bcsytd3 + ll_bcs3
		ll_bcsytd6 				= ll_bcsytd6 + ll_bcs6
		ll_bcsytd9 				= ll_bcsytd9 + ll_bcs9
		ll_bcsytd12 			= ll_bcsytd12 + ll_bcs12
		ll_leadscreatedytd 	= ll_leadscreatedytd + ll_leadscreated
		ll_loansclosedytd		= ll_loansclosedytd + ll_loansclosed
	END IF
	
	// Display the YTD value.  Avoid unnecessary updates.
	This.SetItem ( ll_row, 'bcsytd', ll_bcsytd )
	This.SetItem ( ll_row, 'avgbcs3mthytd', ll_bcsytd3 )
	This.SetItem ( ll_row, 'avgbcs6mthytd', ll_bcsytd6 )
	This.SetItem ( ll_row, 'avgbcs9mthytd', ll_bcsytd9 )
	This.SetItem ( ll_row, 'avgbcs12mthytd', ll_bcsytd12 )
	This.SetItem ( ll_row, 'leadscreatedytd', ll_leadscreatedytd )
	This.SetItem ( ll_row, 'loansclosedytd', ll_loansclosedytd )
	
	This.SetItemStatus ( ll_row, 'bcsytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'avgbcs3mthytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'avgbcs6mthytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'avgbcs9mthytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'avgbcs12mthytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'leadscreatedytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'loansclosedytd', Primary!, NotModified! )
	
NEXT

// Put us back on the original row and column.
ls_findstring = &
	'year=' + string ( ll_currentyear ) + ' and month=' + string ( ll_currentmonth )
ll_row = This.Find ( ls_findstring, 1, ll_rowcount )
This.SetRow ( ll_row )
This.ScrollToRow ( ll_row )
This.SetColumn ( ll_column )

This.SetFocus ()

Return 1
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Share data with the comments display.
//						Turn on required column service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ShareData ( dw_override_entry_comment )

This.of_SetReqColumn ( True )

This.SetRowFocusIndicator ( Hand! )

This.tag = 'am_override'

end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Scroll the comment datawindow to the same row.
//						Filter the history datawindow.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_year
string ls_filterstring

IF currentrow < 1 THEN
	Return AncestorReturnValue
END IF

dw_override_entry_comment.ScrollToRow ( currentrow )

ll_month = This.GetItemNumber ( currentrow, 'month' )
ll_year	= This.GetItemNumber ( currentrow, 'year' )

IF	IsNull ( ll_month ) &
OR IsNull ( ll_year ) THEN
	ll_month = 0
	ll_year = 0
END IF

ls_filterstring = 'month=' + String (ll_month ) &
	+ ' and year=' + String ( ll_year )
dw_override_history.SetFilter ( ls_filterstring )
dw_override_history.Filter ()	

Return AncestorReturnValue
end event

event pfc_validation;call super::pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Add the PersIDNum of the Selected Account Manager.
//
//						Verify that the Year/Month key has no duplicates.
//						
//						Note that required data is checked by the ancestor script.
//
//						Insert a row in the history datawindow for each modification.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// Be sure to stop if the ancestor script has trapped errors.
IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
END IF

datetime ldt_datemdfd
dwitemstatus le_itemstatus

long ll_month
long ll_year
long ll_month_priorrow
long ll_year_priorrow
long ll_persidnum
long ll_row
long ll_rowcount
long ll_rowhistory
long ll_sequencenum
string ls_filterstring

ldt_datemdfd = DateTime ( Today(), Now() )

// Be sure we have a selected manager key.
IF	dw_selected_account_manager.RowCount () <> 1 THEN
	MessageBox ( 'Programmer Error BCS Factors', &
		'ParentWindow.Title - dw_account_manager_bcs_factors:pfc_validation.  ' &
		+ 'Wrong number of Selected Account Managers.', StopSign!, OK! )
	Return -1
END IF

// Sort the display so that we can verify that dates have no gaps.
This.SetSort ( 'year D, month D' )
This.Sort ()

ll_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// Be sure that new rows have a PersIDNum.		
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
		
	CHOOSE CASE le_itemstatus
		CASE NewModified!
			This.SetItem ( ll_row, 'persidnum', ll_persidnum )
			
		CASE DataModified!
	END CHOOSE
	
	CHOOSE CASE ll_row
			
		CASE 1
			ll_month_priorrow = This.GetItemNumber ( 1, 'month' )
			ll_year_priorrow 	= This.GetItemNumber ( 1, 'year' )
			
		CASE ELSE
			// Rule:  No duplicates.
			ll_year 		= This.GetItemNumber ( ll_row, 'year' )
			ll_month 	= This.GetItemNumber ( ll_row, 'month' )	

			IF	ll_year = ll_year_priorrow &
			AND ll_month = ll_month_priorrow THEN
				MessageBox ( 'Account Manager Overrides', &
					'The Year/Month cannot the same as that on the prior row.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'year' )
				This.SetFocus ()
				Return -1
			END IF
			
			ll_year_priorrow	= ll_year
			ll_month_priorrow	= ll_month
			
	END CHOOSE
			
NEXT

// If all of the validation is successful, then insert rows in the history control.
// Note: DO NOT do this if there is any possibility of an error.  We are not
// prepared to run this script twice without saving.

// Verify that history is predictably sorted.
dw_override_history.SetSort ( 'year D, month D, sequencenum D' )
dw_override_history.Sort ()

// Loop thru user entries.
FOR ll_row = 1 TO ll_rowcount
	
	// Find modified rows.
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
	
	CHOOSE CASE le_itemstatus
			
		CASE NewModified!, DataModified!
			
			// Flag this row as 'saved' so we protect year/month.
			This.SetItem ( ll_row, 'cc_saved', 1 )
			This.SetItem ( ll_row, 'datemdfd', ldt_datemdfd )
			
			// Set the history filter.  It's just easier.
			ll_year 	= This.GetItemNumber ( ll_row, 'year' )
			ll_month	= This.GetItemNumber ( ll_row, 'month' )
			
			// Calculate the yearmonth.			
			This.SetItem ( ll_row, 'yearmonth', ( ll_year * 100 ) + ll_month )
			
			ls_filterstring = 'year=' + String ( ll_year ) &
				+ ' and month=' + String ( ll_month )
			dw_override_history.SetFilter ( ls_filterstring )
			dw_override_history.Filter ()
			
			// Establish the new sequence number.
			IF	dw_override_history.RowCount () > 0 THEN
				ll_sequencenum = dw_override_history.GetItemNumber ( 1, 'sequencenum' )
			ELSE
				ll_sequencenum = 0
			END IF
			ll_sequencenum = ll_sequencenum + 1
			
			// Insert a new row.
			ll_rowhistory = dw_override_history.InsertRow ( 1 )
			dw_override_history.SetItem ( ll_rowhistory, 'persidnum', ll_persidnum )
			dw_override_history.SetItem ( ll_rowhistory, 'sequencenum', ll_sequencenum )
			dw_override_history.SetItem ( ll_rowhistory, 'year', ll_year )
			dw_override_history.SetItem ( ll_rowhistory, 'month', ll_month )
			dw_override_history.SetItem ( ll_rowhistory, 'yearmonth', &
				( ll_year * 100 ) + ll_month )
			dw_override_history.SetItem ( ll_rowhistory, 'datemdfd', ldt_datemdfd )
			
			// Get the current and prior values.
			dw_override_history.SetItem ( ll_rowhistory, 'frombcs', &
				This.GetItemNumber ( ll_row, 'bcs', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'tobcs', &
				This.GetItemNumber ( ll_row, 'bcs' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromavgbcs3mth', &
				This.GetItemNumber ( ll_row, 'avgbcs3mth', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toavgbcs3mth', &
				This.GetItemNumber ( ll_row, 'avgbcs3mth' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromavgbcs6mth', &
				This.GetItemNumber ( ll_row, 'avgbcs6mth', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toavgbcs6mth', &
				This.GetItemNumber ( ll_row, 'avgbcs6mth' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromavgbcs9mth', &
				This.GetItemNumber ( ll_row, 'avgbcs9mth', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toavgbcs9mth', &
				This.GetItemNumber ( ll_row, 'avgbcs9mth' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromavgbcs12mth', &
				This.GetItemNumber ( ll_row, 'avgbcs12mth', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toavgbcs12mth', &
				This.GetItemNumber ( ll_row, 'avgbcs12mth' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromleadscreated', &
				This.GetItemNumber ( ll_row, 'leadscreated', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toleadscreated', &
				This.GetItemNumber ( ll_row, 'leadscreated' ) )
				
			dw_override_history.SetItem ( ll_rowhistory, 'fromloansclosed', &
				This.GetItemNumber ( ll_row, 'loansclosed', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toloansclosed', &
				This.GetItemNumber ( ll_row, 'loansclosed' ) )
				
			// Copy the current comment.	
			dw_override_history.SetItem ( ll_rowhistory, 'comment', &
				This.GetItemString ( ll_row, 'comment' ) )

	END CHOOSE	
	
NEXT

// Set the filter back to show changes for the current row.
ll_row = This.GetRow ()
ll_year 	= This.GetItemNumber ( ll_row, 'year' )
ll_month	= This.GetItemNumber ( ll_row, 'month' )

ls_filterstring = 'year=' + String ( ll_year ) &
	+ ' and month=' + String ( ll_month )
dw_override_history.SetFilter ( ls_filterstring )
dw_override_history.Filter ()

Return 1
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Be sure we have a valid month and year.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer ll_test

// We'll check required fields on Save.
IF	Len ( Trim ( data ) ) < 1 THEN
	Return 0
END IF

// Check field entered only. See pfc_validation for data relationship checks.
CHOOSE CASE dwo.name
		
	CASE 'year'
		ll_test = Integer ( data )
		IF	ll_test > 2099 &
		OR ll_test < 2000 THEN
			MessageBox ( 'AMCP Overrides', 'Year must be between 2000 and 2099.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'month'
		ll_test = Integer ( data )
		IF	ll_test > 12 &
		OR ll_test < 1 THEN
			MessageBox ( 'AMCP Override', 'Month must be between 1 and 12.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
END CHOOSE

// Reset the YTD display.
This.Event Post ue_recalculate_ytd ()

Return 0
end event

event pfc_insertrow;call super::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	EXTEND the ancestor script to default the Begin Year/Month.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_year

// Skip errors.
IF	AncestorReturnValue < 1 THEN
	Return AncestorReturnValue
END IF

CHOOSE CASE	AncestorReturnValue 
	CASE This.RowCount ()
		// There is no prior row.  
		// Default Year/Month to today.
		ll_year 	= Year ( Today () )
		ll_month = Month ( Today () )
		
	CASE ELSE
		// There is a previous Year/Month.
		// Set Begin Year/Month to previous end plus one month.
		ll_year	= This.GetItemNumber ( AncestorReturnValue + 1, 'year' )
		ll_month	= This.GetItemNumber ( AncestorReturnValue + 1, 'month' )
		IF	ll_month = 12 THEN
			ll_year = ll_year + 1 
			ll_month	= 1
		ELSE
			ll_month = ll_month + 1
		END IF

END CHOOSE

This.SetItem ( AncestorReturnValue, 'year', ll_year )
This.SetItem ( AncestorReturnValue, 'month', ll_month )
This.SetColumn ( 'year' )
This.SetRow ( AncestorReturnValue )

Return AncestorReturnValue

end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Recalculate the YTD values.
//						Note: We could use a computed column on the dwo except that 
//								we are sorted in the wrong order.
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

This.Event Post ue_recalculate_ytd ()

Return AncestorReturnValue
end event

event pfc_update;call super::pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor script to update the override history.
//						We need to update it AFTER we update this table.
//						Since we make it modified in this datawindow's pfc_validation
//						event, it will not be in the window's list of objects to
//						update.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
ELSE
	Return dw_override_history.Event pfc_update ( ab_accepttext, ab_resetflag )
END IF
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Trap button click
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	01/27/2003	New.
//
//////////////////////////////////////////////////////////////////////////////
end event

event buttonclicked;call super::buttonclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Trap button click.  Make report datawindow visible.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	01/27/2003	New. PHHIT 49939.
//
//////////////////////////////////////////////////////////////////////////////

IF	IsValid ( dwo ) THEN
ELSE
	Return
END IF

CHOOSE CASE dwo.name
	CASE 'b_clientdetail'
	CASE ELSE
		Return
END CHOOSE

date ld_end
datetime ldt_end
datetime ldt_start
long ll_persidnum
long ll_month
long ll_year
long ll_yearmonth

ll_persidnum 	= dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )
ll_year 			= This.GetItemNumber ( row, 'year' )
ll_month 		= This.GetItemNumber ( row, 'month' )

ll_yearmonth	= ( ll_year * 100 ) + ll_month
ldt_start = Datetime ( Date ( String ( ll_month ) + '/1/' + String ( ll_year ) ) )


// Compute the last day of the Month.
IF	ll_month = 12 THEN
	ll_month	= 1
	ll_year 	= ll_year + 1
ELSE
	ll_month = ll_month + 1
END IF

// Figure out the period end date.
ld_end = &
	Date ( String ( ll_month ) + '/1/' + String ( ll_year ) )
ld_end = RelativeDate ( ld_end, - 1 )
ldt_end = DateTime ( ld_end, Time ( '00:00:00' ) )

IF	dw_override_leadloan_detail.Retrieve ( ll_persidnum, &
													ll_yearmonth, &
													ldt_start, &
													ldt_end ) < 1 THEN
	dw_override_leadloan_detail.InsertRow ( 1 )
END IF
													
dw_override_leadloan_detail.visible 	= True
dw_override_leadloan_detail.BringToTop = True



end event

type dw_override_entry_comment from u_dw within w_amcp_account_manager
integer x = 37
integer y = 1088
integer width = 3566
integer height = 192
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_accountmanager_amcp_override_comment"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setreqcolumn ( True )

This.tag = ''


end event

event ue_dwnkey;//////////////////////////////////////////////////////////////////////////////
//
//!!	Description:  Placeholder event to be used to control scrolling.
//
//	Arguments:  keycode		key
//					unsignedlog	keyflags
//
//	Returns:  long
//	 1 = Success
//	 0 = No action
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

//Example script:
long ll_current_row

CHOOSE CASE key
	CASE	KeyPageUp!, &
			KeyPageDown!, &
			KeyEnd!, &
			KeyHome!, &
			KeyLeftArrow!, &
			KeyUpArrow!, &
			KeyRightArrow!, &
			KeyDownArrow!, &
			KeyTab!
		
		// We cannot stop the action from being performed.
		// We can only scroll back to the current row.
		ll_current_row = This.GetRow ()
		This.Post ScrollToRow ( ll_current_row )
		
	CASE ELSE
		
END CHOOSE

Return 0


end event

type dw_override_history from u_dw within w_amcp_account_manager
event type long ue_retrieveafterupdate ( )
string tag = "am_5"
integer x = 37
integer y = 1292
integer width = 3566
integer height = 512
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_accountmanager_amcp_override_history"
boolean hsplitscroll = true
end type

event ue_retrieveafterupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Retrieve after an update.  Reset the filter.
//
//	Arguments:  none
//
//	Returns:  long	Count of rows retrieved.
//		
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_persidnum
long ll_row
long ll_rowcount
long ll_year

ll_persidnum 	= dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

ll_rowcount 	= This.Retrieve ( ll_persidnum )

// Set the filter back to show changes for the current row.
ll_row 	= dw_override_entry.GetRow ()
IF	ll_row > 0 THEN
	ll_year 	= dw_override_entry.GetItemNumber ( ll_row, 'year' )
	ll_month	= dw_override_entry.GetItemNumber ( ll_row, 'month' )	
	This.SetFilter ( 'year=' + String ( ll_year ) &
		+ ' and month=' + String ( ll_month ) )
	This.Filter ()
END IF

Return ll_rowcount
end event

event updateend;call super::updateend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Post an event to retrieve after update.
//						We need to do this because the database sets the
//						Modified On field.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.Event Post ue_retrieveafterupdate ()

Return AncestorReturnValue

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We are updateable.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = True

This.tag = 'am_override_history'
end event

type dw_account_manager_bcs_factors from u_dw within w_amcp_account_manager
string tag = "am_1"
integer x = 78
integer y = 372
integer width = 1248
integer height = 1436
integer taborder = 30
string dataobject = "d_accountmanager_bcs_factors"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Share data with the comments display.
//						Turn on required column service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ShareData ( dw_account_manager_bcs_factors_comment )

This.of_SetReqColumn ( True )

This.SetRowFocusIndicator ( Hand! )

This.tag = 'am_bcs'
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Scroll the comment datawindow to the same row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

dw_account_manager_bcs_factors_comment.ScrollToRow ( currentrow )

Return AncestorReturnValue
end event

event type integer pfc_validation();call super::pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Add the PersIDNum of the Selected Account Manager.
//						Convert the entered BCSFactorPercent to the BCSFactor.
//
//						Verify that the Begin Year/Month leave no gaps
//						between this row and the prior one.
//						
//						Note that required data is checked by the ancestor script.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// Be sure to stop if the ancestor script has trapped errors.
IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
END IF

dwitemstatus le_itemstatus

long ll_bcsfactorpercent
long ll_begindate
long ll_beginmonth
long ll_beginyear
long ll_beginmonth_priorrow
long ll_beginyear_priorrow
long ll_enddate
long ll_endmonth
long ll_endyear
long ll_persidnum
long ll_row
long ll_rowcount

// Be sure we have a selected manager key.
IF	dw_selected_account_manager.RowCount () <> 1 THEN
	MessageBox ( 'Programmer Error BCS Factors', &
		'ParentWindow.Title - dw_account_manager_bcs_factors:pfc_validation.  ' &
		+ 'Wrong number of Selected Account Managers.', StopSign!, OK! )
	Return -1
END IF

// Sort the display so that we can verify that dates have no gaps.
This.SetSort ( 'beginyear D, beginmonth D' )
This.Sort ()

ll_persidnum = dw_selected_account_manager.GetItemNumber ( 1, 'phhmanager_a_persidnum' )

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// Be sure that new rows have a PersIDNum.
	// Get the fractional value (proportion) from the entered BCS Factor Percent.
	
	ll_bcsfactorpercent 	= This.GetItemNumber ( ll_row, 'bcsfactorpercent' )
	IF	IsNull ( ll_bcsfactorpercent ) THEN		
		MessageBox ( 'BCS Factors', &
			'The BCS Factor is required.  Please correct.', Information!, OK! )
		This.SetRow ( ll_row )
		This.SetColumn ( 'endyear' )
		This.SetFocus ()
		Return -1
	END IF
		
	// Grab the relevant date information for our checks.
	IF	ll_row > 1 THEN		
		ll_beginmonth_priorrow 	= This.GetItemNumber ( ll_row - 1, 'beginmonth' )
		ll_beginyear_priorrow 	= This.GetItemNumber ( ll_row - 1, 'beginyear' )
	END IF	
	ll_endyear 		= This.GetItemNumber ( ll_row, 'endyear' )
	ll_endmonth 	= This.GetItemNumber ( ll_row, 'endmonth' )
	ll_beginyear 	= This.GetItemNumber ( ll_row, 'beginyear' )
	ll_beginmonth 	= This.GetItemNumber ( ll_row, 'beginmonth' )
	
	// Update the computed database columns.
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
		
	CHOOSE CASE le_itemstatus
		CASE NewModified!
			This.SetItem ( ll_row, 'persidnum', ll_persidnum )			
	END CHOOSE
	
	CHOOSE CASE le_itemstatus
		CASE NewModified!, DataModified!
			This.SetItem ( ll_row, 'bcsfactor', ( ll_bcsfactorpercent / 100 ) )
			This.SetItem ( ll_row, 'beginyearmonth', &
				( ll_beginyear * 100 ) + ll_beginmonth )			
			This.SetItem ( ll_row, 'endyearmonth', &
				( ll_endyear * 100 ) + ll_endmonth )
	END CHOOSE
	
	// Rule:  Beginning date must be less than or equal to ending date.
	ll_begindate = ( ll_beginyear * 100 ) + ll_beginmonth
	ll_enddate = ( ll_endyear * 100 ) + ll_endmonth
	IF	ll_begindate > ll_enddate THEN		
		MessageBox ( 'BCS Factors', &
			'The Begin Year/Month cannot be after the End Year/Month.  Please correct.', Information!, OK! )
		This.SetRow ( ll_row )
		This.SetColumn ( 'endyear' )
		This.SetFocus ()
		Return -1
	END IF
	
	CHOOSE CASE ll_row
			
		CASE 1 
			// Rule: The first row must not expire.
			IF ll_endyear <> 2099 THEN
				MessageBox ( 'BCS Factors', &
					'The most recent BCS Factor must not expire.  Please set End Year to 2099. End Month to 12.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'endyear' )
				This.SetFocus ()
				Return -1
			END IF		
			
			IF ll_endmonth <> 12 THEN
				MessageBox ( 'BCS Factors', &
					'The most recent BCS Factor must not expire.  Please set End Month to 12.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'endmonth' )
				This.SetFocus ()
				Return -1
			END IF	

		CASE ELSE
			// For all rows other than the first one, we need to check for incorrect dates.			
			// Rule: The prior begin year/month must be one month from the current row's end year/month.
			// (Remember that we are sorted in descending order.)
			CHOOSE CASE ll_beginyear_priorrow
				CASE ll_endyear
					// Same year.
					CHOOSE CASE ll_beginmonth_priorrow
						CASE ll_endmonth + 1
							// Valid.  No gap.
						CASE ELSE
							// Error.
							// Years are OK.  Problem with months.
							MessageBox ( 'BCS Factors', &
								'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
								+ ' Please fix.', &
								Information!, OK! )
							This.SetRow ( ll_row - 1 )
							This.SetColumn ( 'beginmonth' )
							This.SetFocus ()	
							Return -1
					END CHOOSE
				CASE ll_endyear + 1
					// Next year.  Months must be December and January.
					IF	ll_endmonth = 12 &
					AND ll_beginmonth_priorrow = 1 THEN
						// Got it right.
					ELSE
						// Problem with years.
						MessageBox ( 'BCS Factors', &
							'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
							+ ' Please fix.', &
							Information!, OK! )
						This.SetRow ( ll_row - 1 )
						This.SetColumn ( 'beginmonth' )	
						This.SetFocus ()	
						Return -1						
					END IF
				CASE ELSE
					// Problem with years.
					MessageBox ( 'BCS Factors', &
						'The Begin Year/Month of this row must be one month after the End Year/Month of the next row.' &
						+ ' Please fix.', &
						Information!, OK! )
					This.SetRow ( ll_row - 1 )
					This.SetColumn ( 'beginyear' )
					This.SetFocus ()	
					Return -1
			END CHOOSE

	END CHOOSE
			
NEXT

Return 1
end event

event itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Be sure we have a valid month and year.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer ll_test

// We'll check required fields on Save.
IF	Len ( Trim ( data ) ) < 1 THEN
	Return 0
END IF

// Check field entered only. See pfc_validation for data relationship checks.
CHOOSE CASE dwo.name
		
	CASE 'beginyear','endyear'
		ll_test = Integer ( data )
		IF	ll_test > 2099 &
		OR ll_test < 2000 THEN
			MessageBox ( 'BCS Factors', 'Year must be between 2000 and 2099.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'beginmonth', 'endmonth'
		ll_test = Integer ( data )
		IF	ll_test > 12 &
		OR ll_test < 1 THEN
			MessageBox ( 'BCS Factors', 'Month must be between 1 and 12.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'bcsfactorpercent'
		ll_test = Integer ( data )
		IF	ll_test < 0 THEN
			MessageBox ( 'BCS Factors', 'BCS Factor a positive number.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF		
		
END CHOOSE

Return 0

end event

event pfc_insertrow;call super::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	EXTEND the ancestor script to default the Begin Year/Month.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_beginmonth
long ll_beginyear
long ll_endmonth
long ll_endyear

// Skip errors.
IF	AncestorReturnValue < 1 THEN
	Return AncestorReturnValue
END IF

CHOOSE CASE	AncestorReturnValue 
	CASE This.RowCount ()
		// There is no prior row.  
		// Default Begin Year/Month to today.
		// Default End Year/Month to the maximum.
		ll_beginyear 	= Year ( Today () )
		ll_beginmonth 	= Month ( Today () )
		ll_endyear		= 2099
		ll_endmonth		= 12		
	CASE ELSE
		// There is a previous End Year/Month.
		// Set Begin Year/Month to previous end plus one month.
		ll_endyear	= This.GetItemNumber ( AncestorReturnValue + 1, 'endyear' )
		ll_endmonth	= This.GetItemNumber ( AncestorReturnValue + 1, 'endmonth' )
		IF	ll_endmonth = 12 THEN
			IF	ll_endyear = 2099 THEN
				ll_beginyear	= 2099
				ll_beginmonth	= 12
			ELSE
				ll_beginyear 	= ll_endyear + 1
				ll_beginmonth 	= 1
			END IF
		ELSE
			ll_beginyear	= ll_endyear
			ll_beginmonth 	= ll_endmonth + 1
		END IF
		// Set the End Year/Month depending on whether or not this is the first row.
		IF	AncestorReturnValue = 1 THEN
			// Set the never-expire default.
			ll_endyear		= 2099
			ll_endmonth		= 12
		ELSE
			// Set to the begin year/month.
			ll_endyear		= ll_beginyear
			ll_endmonth		= ll_beginmonth
		END IF
END CHOOSE

This.SetItem ( AncestorReturnValue, 'beginyear', ll_beginyear )
This.SetItem ( AncestorReturnValue, 'beginmonth', ll_beginmonth )
This.SetItem ( AncestorReturnValue, 'endyear', ll_endyear )
This.SetItem ( AncestorReturnValue, 'endmonth', ll_endmonth )
This.SetColumn ( 'beginyear' )
This.SetRow ( AncestorReturnValue )

Return AncestorReturnValue

end event

type dw_override_leadloan_detail from u_dw within w_amcp_account_manager
string tag = "am_5"
integer x = 37
integer y = 1088
integer width = 3566
integer height = 716
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_amcp_reports_acctmgr_leads_loans"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We are NOT updateable.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	01/27/2003	New. PHHIT 49939.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

// Make the button visible.
This.object.b_reset.visible = '1'

This.tag = 'am_override_detail'
end event

event buttonclicked;call super::buttonclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Make us invisible.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	01/27/2003	New. PHHIT 49939.
//
//////////////////////////////////////////////////////////////////////////////

IF IsValid ( dwo ) THEN
	This.Visible = False
	This.BringToTop = False
END IF
end event


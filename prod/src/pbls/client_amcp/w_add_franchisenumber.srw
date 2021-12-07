$PBExportHeader$w_add_franchisenumber.srw
$PBExportComments$AMCP.  New.
forward
global type w_add_franchisenumber from pfc_w_response
end type
type st_signed_office_header from statictext within w_add_franchisenumber
end type
type dw_office_list from u_dw within w_add_franchisenumber
end type
type dw_client_franchise_numbers from u_dw within w_add_franchisenumber
end type
type st_office_list from statictext within w_add_franchisenumber
end type
type dw_office_search_criteria from u_dw within w_add_franchisenumber
end type
type st_office_search_critieria from statictext within w_add_franchisenumber
end type
type cb_delete from u_cb within w_add_franchisenumber
end type
type cb_save from u_cb within w_add_franchisenumber
end type
type cb_close from u_cb within w_add_franchisenumber
end type
type cb_undelete from u_cb within w_add_franchisenumber
end type
type cb_add from u_cb within w_add_franchisenumber
end type
type st_signed_office_list from statictext within w_add_franchisenumber
end type
end forward

global type w_add_franchisenumber from pfc_w_response
integer x = 0
integer y = 0
integer width = 3529
integer height = 2016
string title = "Franchise Number Add/Expire"
event ue_setcalender ( )
st_signed_office_header st_signed_office_header
dw_office_list dw_office_list
dw_client_franchise_numbers dw_client_franchise_numbers
st_office_list st_office_list
dw_office_search_criteria dw_office_search_criteria
st_office_search_critieria st_office_search_critieria
cb_delete cb_delete
cb_save cb_save
cb_close cb_close
cb_undelete cb_undelete
cb_add cb_add
st_signed_office_list st_signed_office_list
end type
global w_add_franchisenumber w_add_franchisenumber

type variables

integer ii_officetypecd // "Physical" = 1

n_ds ids_clientfranchise
n_ds ids_officeacctmanager

string is_clntid
end variables

forward prototypes
public subroutine of_setcolumn (u_dw adw_dw, string as_column, long al_row)
end prototypes

public subroutine of_setcolumn (u_dw adw_dw, string as_column, long al_row);adw_dw.Setfocus()
adw_dw.ScrollToRow(al_row)
adw_dw.SetColumn(as_column)
end subroutine

on w_add_franchisenumber.create
int iCurrent
call super::create
this.st_signed_office_header=create st_signed_office_header
this.dw_office_list=create dw_office_list
this.dw_client_franchise_numbers=create dw_client_franchise_numbers
this.st_office_list=create st_office_list
this.dw_office_search_criteria=create dw_office_search_criteria
this.st_office_search_critieria=create st_office_search_critieria
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_close=create cb_close
this.cb_undelete=create cb_undelete
this.cb_add=create cb_add
this.st_signed_office_list=create st_signed_office_list
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_signed_office_header
this.Control[iCurrent+2]=this.dw_office_list
this.Control[iCurrent+3]=this.dw_client_franchise_numbers
this.Control[iCurrent+4]=this.st_office_list
this.Control[iCurrent+5]=this.dw_office_search_criteria
this.Control[iCurrent+6]=this.st_office_search_critieria
this.Control[iCurrent+7]=this.cb_delete
this.Control[iCurrent+8]=this.cb_save
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_undelete
this.Control[iCurrent+11]=this.cb_add
this.Control[iCurrent+12]=this.st_signed_office_list
end on

on w_add_franchisenumber.destroy
call super::destroy
destroy(this.st_signed_office_header)
destroy(this.dw_office_list)
destroy(this.dw_client_franchise_numbers)
destroy(this.st_office_list)
destroy(this.dw_office_search_criteria)
destroy(this.st_office_search_critieria)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.cb_undelete)
destroy(this.cb_add)
destroy(this.st_signed_office_list)
end on

event pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Retrieve the list of SIGNED Offices for this Client.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_rowcount

IF	Len ( Trim ( This.is_clntid ) ) < 5 &
	OR IsNull ( This.is_clntid ) THEN
	MessageBox ( 'Add Franchise Numbers', &
		'Programmer Error:  Invalid Client ID.' )
	Close ( This )
	Return
END IF

// Find out whether or not we are dealing with a "physical" Client.
gnv_app.ids_work.dataobject = 'd_client_officetypecd_hidden'
gnv_app.ids_work.of_SetTransObject ( SQLCA )
ll_rowcount = gnv_app.ids_work.Retrieve ( This.is_clntid )
IF	ll_rowcount < 1 THEN	
	MessageBox ( 'Add Franchise Numbers', &
		'Programmer Error:  Invalid Client ID.' )
	Close ( This )
	Return
END IF

This.ii_officetypecd = gnv_app.ids_work.GetItemNumber ( 1, 'officetypecd' )
IF	IsNull ( This.ii_officetypecd ) THEN
	This.ii_officetypecd = -1
END IF

// Retrieve the SIGNED Offices.
dw_client_franchise_numbers.Retrieve ( This.is_clntid )
end event

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Capture and save the passed Client ID.  Format the header.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.is_clntid = gnv_app.istr_client.clntid

IF IsNull( This.is_clntid ) THEN
	// We were not passed a Client ID.
	This.is_clntid = ''
END IF

st_signed_office_header.text = "SIGNED Offices for Client ID " + This.is_clntid


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

event pfc_postupdate;call super::pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor.
//						Reset the Office List.  It will have new dates.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// Trigger the event to refresh Office list.
dw_office_list.Reset ()

Return 1
end event

type st_signed_office_header from statictext within w_add_franchisenumber
integer x = 37
integer y = 12
integer width = 1568
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
string text = "SIGNED Offices for Client ID "
boolean focusrectangle = false
end type

type dw_office_list from u_dw within w_add_franchisenumber
integer x = 32
integer y = 992
integer width = 3433
integer height = 800
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_search_franchise_number_list"
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

This.ib_isupdateable = True

// Sort by column header.
This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

// PFC Filter dialog.
This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// Extended row selection.
This.of_SetRowSelect ( True )
This.inv_rowselect.of_setstyle ( 2 )

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

type dw_client_franchise_numbers from u_dw within w_add_franchisenumber
integer x = 27
integer y = 80
integer width = 3433
integer height = 484
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_update_client_franchise_numbers"
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

This.ib_isupdateable = True

// Sort by column header.
This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.Tag = ''

This.of_SetDropDownCalendar ( True )
This.iuo_calendar.of_Register ( 'clntfranchise_endeffdate', &
  	This.iuo_calendar.DDLB_WITHARROW )
This.iuo_calendar.of_Register ( 'clntfranchise_begineffdate', &
	This.iuo_calendar.DDLB_WITHARROW )


end event

event type long pfc_addrow();//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Verify that we have a selected row to copy.
//						Check to be sure this isn't already SIGNED to a 'physical'
//						office somewhere else.
//						Copy the ClntFranchise table info, default effective dates.
//
//	Arguments:	None
//
//	Returns:	Integer
//				1	Success
//				0	No Action
//				-1	Error
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

date ld_begineffdate
date ld_endeffdate

datetime ldt_officeacctmanager_endeffdate

integer li_officetypecd

long ll_idx
long ll_max
long ll_newrow
long ll_row
long ll_rowcount
long ll_rowtocopy
long ll_selectedrow[]

string ls_clntid
string ls_findstring
string ls_franchisenum[]

ids_clientfranchise.SetFilter ( '' )
ids_clientfranchise.Filter ()

ll_rowtocopy = dw_office_list.GetSelectedRow ( 0 )
IF	ll_rowtocopy < 1 THEN
	MessageBox ( 'Add Franchise Number', 'You must highlight a row to be copied.' )
	Return 0
END IF

DO WHILE ll_rowtocopy > 0
	ll_max = ll_max + 1	
	ll_selectedrow[ll_max] = ll_rowtocopy	
	ls_franchisenum[ll_max] = &
		dw_office_list.GetItemString ( ll_rowtocopy, 'office_franchisenum' ) 
	ll_rowtocopy = dw_office_list.GetSelectedRow ( ll_rowtocopy )
LOOP

// Set the default Begin date.
ld_begineffdate = Today () 

FOR ll_idx = 1 TO ll_max
	
	// Is this Office already SIGNED here?
	ls_findstring = 'office_franchisenum="' + ls_franchisenum[ll_idx] + '"'
	ll_row = This.Find ( ls_findstring, 1, This.RowCount () )
	IF	ll_row > 0 THEN
		// Modified 01/27/2003.  PHHIT 49963.  LANelson.  Check dates before producing this message.
		date ld_clntfranchise_endeffdate
		date ld_month_start
		ld_month_start = &
			Date ( String ( Month ( Today() ) ) + '/01/' + String ( Year ( Today() ) ) )
		ld_clntfranchise_endeffdate = Date ( This.GetItemDateTime ( ll_row, 'clntfranchise_endeffdate' ) )
		IF	ld_clntfranchise_endeffdate < ld_month_start THEN
			// We can 'reactivate'.  No errors.
		ELSE
			MessageBox ( 'SIGNED Offices', &
				'Franchise Number ' + ls_franchisenum[ll_idx] &
				+ ' is already on the SIGNED list. Skipped it. Please do not try to SIGN it again.', &
				+ Information!, OK! )
			dw_office_list.SelectRow ( ll_selectedrow[ll_idx], False )
			CONTINUE
		END IF
		// Modified 01/27/2003 end.
	END IF

	// Check whether or not this office is SIGNED to another 'physical' client.
	IF	ii_officetypecd = 1 THEN
		// This is a "physical" client. The selected office cannot be assigned
		// to another "physical" client any time in the current month.
		ll_rowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )
		
		FOR ll_row = 1 TO ll_rowcount
			li_officetypecd = ids_clientfranchise.GetItemNumber ( ll_row, 'client_officetypecd' )
			IF	li_officetypecd = 1 THEN
				ls_clntid		= ids_clientfranchise.GetItemString ( ll_row, 'clntid' )	
				ld_endeffdate	= &
					Date ( ids_clientfranchise.GetItemDateTime ( ll_row, 'endeffdate' ) )
				IF	ld_endeffdate = Date ( '12/31/2099' ) THEN
					MessageBox ( 'Too many Physical Client IDs', &
						'This Office is already SIGNED with Client ID ' + ls_clntid + '.' &
						+ '  The Client ID is also a "Physical" Office Type.  ' &
						+ '  The expiration date is 12/31/2099.~r~n~r~n', Information!,  OK! )
					dw_office_list.ScrollToRow (  ll_selectedrow[ll_idx] )	
					Return -1	
				ELSE
					IF	ld_endeffdate > Today () THEN
						ld_begineffdate = ld_endeffdate
					END IF
				END IF
			END IF
		NEXT
	END IF

	ll_newrow = This.InsertRow ( 1 )
	This.SetItem ( ll_newrow, 'clntfranchise_clntid', Parent.is_clntid )
	This.SetItem ( ll_newrow, 'clntfranchise_clntfranchisenum', ls_franchisenum[ll_idx] )
	This.SetItem ( ll_newrow, 'office_franchisenum', ls_franchisenum[ll_idx] )
	This.SetItem ( ll_newrow, 'clntfranchise_begineffdate', &
		DateTime ( ld_begineffdate, Time ( '00:00:00' ) ) )
	This.SetItem ( ll_newrow, 'clntfranchise_endeffdate', &
		DateTime ( Date ( '12/31/2099' ), Time ( '00:00:00' ) ) )
	This.SetItem ( ll_newrow, 'office_brand', &
		dw_office_list.GetItemString ( ll_selectedrow[ll_idx], 'office_brand' ) )
	This.SetItem ( ll_newrow, 'office_state', &
		dw_office_list.GetItemString (  ll_selectedrow[ll_idx], 'office_state' ) )
	This.SetItem ( ll_newrow, 'office_city', &
		dw_office_list.GetItemString (  ll_selectedrow[ll_idx], 'office_city' ) )
	This.SetItem ( ll_newrow, 'office_region', &
		dw_office_list.GetItemString (  ll_selectedrow[ll_idx], 'office_region' ) )
	This.SetItem ( ll_newrow, 'office_zip', &
		dw_office_list.GetItemString (  ll_selectedrow[ll_idx], 'office_zip' ) )
	This.SetItem ( ll_newrow, 'office_officename', &
		dw_office_list.GetItemString (  ll_selectedrow[ll_idx], 'office_officename' ) )
	This.SetItem ( ll_newrow, 'office_begineffdate', &
		dw_office_list.GetItemDateTime (  ll_selectedrow[ll_idx], 'office_begineffdate' ) )
	This.SetItem ( ll_newrow, 'office_endeffdate', &
		dw_office_list.GetItemDateTime (  ll_selectedrow[ll_idx], 'office_endeffdate' ) )
		
	// Deselect the selected row.	
	dw_office_list.SelectRow (  ll_selectedrow[ll_idx], False )
	
NEXT	

Return 1
end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	The following rules apply only if the current Client
//						is a "physical" Client.  For other clients, the 
//						dates of the account manager assignment do not apply.
//	
//						If the USER has MODIFIED a ClntFranchise.BeginEffDate,
//						then we need to be sure that any OfficeAcctManager
//						EndEffDate is not greater than the modified date.
//
//						If there is an OfficeAcctManager whose EndEffDate is
//						the same as the original ClntFranchise.BeginEffDate,
//						we will also adjust this date.  This avoids gaps in
//						assignment.
//
// 					Note: There can be more than one OfficeAcctManager row
//								for an OfficeIDNum.
//	Rule:
//		 	IF the OfficeAcctManager END date is > the SIGNED BEGIN date THEN
//				IF	OfficeAcctManager BEGIN date is >= SIGNED BEGIN date THEN
//					invalidate the OfficeAcctManager row by setting 
//					the END date equal the BEGIN date
//				ELSE
//					end the OfficeAcctManager assignment on the SIGNED BEGIN date
//				END IF
//			END IF
//			
//			Example:  	The current year/month is 12/2002.
//							The Office was assigned to multiple account managers.
//							Manager 	A	12/1/2002 	until 12/3/2002
//										B	12/3/2002 	until 12/25/2002
//										C	12/25/2002 	until	12/31/2099
//							The user set the SIGNED BEGIN date to 12/13/2002.
//							So.
//							We will pretend that Manager C was never assigned.
//							We will end Manager B's assignment on 12/13/2002.
//							And Manager A has no problems whatsoever.
//							Result:
//							Manager 	A	12/1/2002 	until 12/3/2002
//										B	12/3/2002 	until 12/13/2002
//										C	12/25/2002 	until	12/25/2099
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

date ld_begin_signed
date ld_begineffdate
date ld_clntfranchise_begineffdate[]
date ld_end_am
date ld_end_signed
date ld_endeffdate
date ld_officeacctmanager_endeffdate
date ld_original_begineffdate[]

datetime ldt_begin_am

dwitemstatus le_dwitemstatus
dwitemstatus le_dwitemstatus_begin
dwitemstatus le_dwitemstatus_end

integer li_officetypecd

long 	ll_checkrow
long 	ll_checkrowcount
long	ll_idx
long	ll_max
long	ll_officeidnum[]
long 	ll_row
long 	ll_rowcount

string ls_clntid
string ls_filterstring
string ls_franchisenum[]

// No accidental updates.
ids_officeacctmanager.Reset ()

ids_clientfranchise.SetFilter ( '' )
ids_clientfranchise.Filter ()

ll_rowcount = This.RowCount ()
FOR ll_row = 1 TO ll_rowcount
	
	// We only want to check dates on changed rows.  NewModified rows are
	// saved using default dates.
	le_dwitemstatus = This.GetItemStatus ( ll_row, 0, Primary! )
	CHOOSE CASE le_dwitemstatus
		CASE DataModified!, NewModified!
		CASE ELSE
			Continue
	END CHOOSE
	// Something has changed.
	ld_begineffdate 	= Date ( This.GetItemDateTime ( ll_row, 'clntfranchise_begineffdate' ) )
	ld_endeffdate		= Date ( This.GetItemDateTime ( ll_row, 'clntfranchise_endeffdate' ) )
	
	// Rule: Both Start and End dates are required.
	IF	IsNull ( ld_begineffdate ) &
	OR IsNull ( ld_endeffdate ) THEN
		MessageBox ( 'Franchise Numbers', &
			'Both Start and End Effective dates are required.  Please correct.',&
			Information!, OK! )
		This.SetItem ( ll_row, 'cc_saved', 0 )	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'clntfranchise_begineffdate' )
		Return -1
	END IF
	
	// Rule: Start date cannot be later than End date.
	IF	ld_begineffdate > ld_endeffdate THEN
		MessageBox ( 'Franchise Numbers', &
			'Effective Start date cannot be later than Effective End date.  Please correct.',&
			Information!, OK! )
		This.SetItem ( ll_row, 'cc_saved', 0 )	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'clntfranchise_begineffdate' )
		Return -1
	END IF
	
	// Rule: Both Start and End date cannot be earlier than the current Year/Month.
	//			We check modified to be sure we are not editing a date entered in a prior month.
	le_dwitemstatus_begin =	This.GetItemStatus ( ll_row, 'clntfranchise_begineffdate', Primary! )	
	IF	( Year ( ld_begineffdate ) * 100 ) + Month ( ld_begineffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		IF	ld_begineffdate = &
			Date ( This.GetItemDateTime ( ll_row, &
			'clntfranchise_begineffdate', Primary!, True ) ) THEN
		ELSE			
			MessageBox ( 'SIGNED Offices', &
				'SIGNED Start date cannot be earlier than the current Year/Month.  Please correct.',&
				Information!, OK! )
			This.SetItem ( ll_row, 'cc_saved', 0 )	
			SetRow ( ll_row )
			ScrollToRow ( ll_row )
			SetColumn ( 'clntfranchise_begineffdate' )
			Return -1
		END IF
	END IF
	le_dwitemstatus_end =	This.GetItemStatus ( ll_row, 'clntfranchise_endeffdate', Primary! )	
	IF	( Year ( ld_endeffdate ) * 100 ) + Month ( ld_endeffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		MessageBox ( 'SIGNED Offices', &
			'SIGNED End date cannot be earlier than the current Year/Month.  Please correct.',&
			Information!, OK! )
		This.SetItem ( ll_row, 'cc_saved', 0 )	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'clntfranchise_endeffdate' )
		Return -1
	END IF	
	
	// Check whether or not this office is SIGNED to another 'physical' client.
	IF	ii_officetypecd = 1 THEN
		// This is a "physical" client. The selected office cannot be assigned
		// with overlapping dates.
		ls_franchisenum[1] = This.GetItemString ( ll_row, 'clntfranchise_clntfranchisenum' )
		ll_checkrowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )
		FOR ll_checkrow = 1 TO ll_checkrowcount
			li_officetypecd = ids_clientfranchise.GetItemNumber ( ll_checkrow, 'client_officetypecd' )
			IF	li_officetypecd = 1 THEN
				ls_clntid		= ids_clientfranchise.GetItemString ( ll_checkrow, 'clntid' )	
				ld_end_signed	= &
					Date ( ids_clientfranchise.GetItemDateTime ( ll_checkrow, 'endeffdate' ) )	
				ld_begin_signed	= &
					Date ( ids_clientfranchise.GetItemDateTime ( ll_checkrow, 'endeffdate' ) )
				IF	( ld_begineffdate < ld_end_signed AND ld_begineffdate >= ld_begin_signed ) &
				OR	( ld_endeffdate <= ld_end_signed AND ld_endeffdate > ld_begin_signed )THEN
					MessageBox ( 'Too many Physical Client IDs', &
						'This Office is already SIGNED with Client ID ' + ls_clntid + '.' &
						+ '  The Client ID is also a "Physical" Office Type.  ' &
						+ '  The SIGNED Dates overlap those of Client ID ' &
						+ ls_clntid + '.  Please correct.~r~n~r~n' &
						+ ls_clntid + ' Effective Start is ' &
						+ String ( ld_begin_signed, 'mm/dd/yyyy' ) + '.~r~n' &
						+ ls_clntid + ' Effective End is ' &
						+ String ( ld_end_signed, 'mm/dd/yyyy' ) + '.', &
						Information!,  OK! )	
					SetRow ( ll_row )
					ScrollToRow ( ll_row )
					This.SetItem ( ll_row, 'cc_saved', 0 )	
					IF	le_dwitemstatus_begin = DataModified! THEN
						SetColumn ( 'clntfranchise_begineffdate' )
					ELSE
						SetColumn ( 'clntfranchise_endeffdate' )
					END IF
					Return -1
				END IF
			END IF
		NEXT
	END IF
	
	// Dates are valid.  Add this Office to the array of Account Manager assignment
	// dates to be verified/modified.  We ONLY do this for a "physical" client.
	IF	ii_officetypecd = 1 THEN
		ll_max = ll_max + 1
		ld_clntfranchise_begineffdate[ll_max] 	= ld_begineffdate
		ld_original_begineffdate[ll_max] 		= &
			Date ( This.GetItemDateTime ( ll_row, 'clntfranchise_begineffdate', Primary!, True ) )
		ll_officeidnum[ll_max] 	= This.GetItemNumber ( ll_row, 'office_officeidnum' )
	END IF
	
NEXT

// If we got here because a row was added, we do NOT want to reset the
// Office List.  We only want to go forward if the user actually modified
// a date on a previously saved row.
IF	ll_max < 1 THEN
	Return 1
END IF

// Retrieve the OfficeAcctManager table in the invisible datawindow control.
ll_rowcount = Parent.ids_officeacctmanager.Retrieve ( ll_officeidnum )

// Remember that the Offices we are looking for may NOT have been assigned to an
// Account Manager.
IF	ll_rowcount > 0 THEN
ELSE
	Return 1
END IF

FOR ll_idx = 1 TO ll_max
	
	// Assume the user has modified the BEGIN SIGNED date more than once.
	// Then we should have a OfficeAcctManager row with the END date equal to the
	// original BEGIN SIGNED date.  We just want to keep the OfficeAcctManager
	// END date the same as the new BEGIN SIGNED.
	ls_filterstring = &
		'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
		+ ' and ( Date ( endeffdate ) = ' + String ( ld_original_begineffdate[ll_idx] ) 
	ids_officeacctmanager.SetFilter ( ls_filterstring )
	ids_officeacctmanager.Filter ()
	ll_rowcount = ids_officeacctmanager.RowCount ()
	IF	ll_rowcount > 0 THEN
		ld_end_am = Date ( ids_officeacctmanager.GetItemDateTime ( 1, 'endeffdate' ) )
		IF ld_end_am = ld_original_begineffdate[ll_idx] THEN
			ids_officeacctmanager.SetItem ( 1, 'endeffdate', &
				ld_clntfranchise_begineffdate[ll_idx] )
		END IF
	END IF
		
	// Now terminate any Account Manager assignments whose dates overlap that of the
	// office SIGNED dates.
	// Find all the offices who end in 2099 OR whose End date is greater than
	// the start of the SIGNED association.
	ls_filterstring = &
		'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
		+ ' and ( Date ( endeffdate ) > ' + String ( ld_clntfranchise_begineffdate[ll_idx] ) &
		+ ' or Year ( Date ( endeffdate ) ) = 2099 ) '
	ids_officeacctmanager.SetFilter ( ls_filterstring )
	ids_officeacctmanager.Filter ()
	ll_rowcount = ids_officeacctmanager.RowCount ()
	FOR ll_row = 1 TO ll_rowcount
		// We have a row with an inappropriate end date.  We need to update.
		ldt_begin_am = ids_officeacctmanager.GetItemDateTime ( ll_row, 'begineffdate' )
		IF	Date ( ldt_begin_am ) > ld_clntfranchise_begineffdate[ll_idx] THEN
			// The account manager is due to start AFTER the SIGNED begin date.
			// Just pretend it didn't happen.  Set the End date to the Acct Manager Begin date.
			Parent.ids_officeacctmanager.SetItem ( ll_row, 'endeffdate', ldt_begin_am )
		ELSE
			// Otherwise, just end it on the SIGNED Begin date.
			Parent.ids_officeacctmanager.SetItem ( ll_row, 'endeffdate', &
				ld_clntfranchise_begineffdate[ll_idx] )
		END IF
	NEXT	
NEXT
ids_officeacctmanager.SetFilter ( '' )
ids_officeacctmanager.Filter ()
	
Return 1
end event

event pfc_update;call super::pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor script to update the OfficeAcctManager
//						datastore.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////


IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
END IF

Return ids_officeacctmanager.Event pfc_update ( ab_accepttext, ab_resetflag )

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
	CASE 'clntfranchise_begineffdate', 'clntfranchise_endeffdate'
		This.SetItem ( row, 'cc_saved', 0 )
END CHOOSE

Return 0
end event

type st_office_list from statictext within w_add_franchisenumber
integer x = 37
integer y = 932
integer width = 2094
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
string text = "To add a Franchise Number, highligh a row below and click the Add Franchise Number button."
boolean focusrectangle = false
end type

type dw_office_search_criteria from u_dw within w_add_franchisenumber
event type integer ue_search ( )
event type integer ue_clearcriteria ( )
integer x = 32
integer y = 636
integer width = 3433
integer height = 276
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_search_office_criteria"
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

long ll_return

string ls_clntfranchise_clntid
string ls_office_brand
string ls_office_city
string ls_office_franchisenum
string ls_office_officename
string ls_office_region
string ls_office_state
string ls_office_zip

window lw_frame

IF	This.RowCount () < 1 THEN
	Return -1
END IF

ls_clntfranchise_clntid = This.GetItemString ( 1, 'clntfranchise_clntid' )
IF	Upper ( ls_clntfranchise_clntid ) = 'UNSIGNED' THEN
	SetNull ( ls_clntfranchise_clntid )
ELSE
	IF	IsNull ( ls_clntfranchise_clntid ) &
	OR	Len ( Trim ( ls_clntfranchise_clntid ) ) < 1 THEN
		ls_clntfranchise_clntid = '%'
	ELSE
		ls_clntfranchise_clntid = Trim ( ls_clntfranchise_clntid ) + '%'
	END IF
END IF

ls_office_brand = This.GetItemString ( 1, 'office_brand' )
IF	IsNull ( ls_office_brand ) &
OR	Len ( Trim ( ls_office_brand ) ) < 1 THEN
	ls_office_brand = '%'
ELSE
	ls_office_brand = Trim ( ls_office_brand ) + '%'
END IF

ls_office_city = This.GetItemString ( 1, 'office_city' )
IF	IsNull ( ls_office_city ) &
OR	Len ( Trim ( ls_office_city ) ) < 1 THEN
	ls_office_city = '%'
ELSE
	ls_office_city = Trim ( ls_office_city ) + '%'
END IF

ls_office_franchisenum = This.GetItemString ( 1, 'office_franchisenum' )
IF	IsNull ( ls_office_franchisenum ) &
OR	Len ( Trim ( ls_office_franchisenum ) ) < 1 THEN
	ls_office_franchisenum = '%'
ELSE
	ls_office_franchisenum = Trim ( ls_office_franchisenum ) + '%'
END IF

ls_office_officename = This.GetItemString ( 1, 'office_officename' )
IF	IsNull ( ls_office_officename ) &
OR	Len ( Trim ( ls_office_officename ) ) < 1 THEN
	ls_office_officename = '%'
ELSE
	ls_office_officename = Trim ( ls_office_officename ) + '%'
END IF

ls_office_region = This.GetItemString ( 1, 'office_region' )
IF	IsNull ( ls_office_region ) &
OR	Len ( Trim ( ls_office_region ) ) < 1 THEN
	ls_office_region = '%'
ELSE
	ls_office_region = Trim ( ls_office_region ) + '%'
END IF

ls_office_state = This.GetItemString ( 1, 'office_state' )
IF	IsNull ( ls_office_state ) &
OR	Len ( Trim ( ls_office_state ) ) < 1 THEN
	ls_office_state = '%'
ELSE
	ls_office_state = Trim ( ls_office_state ) + '%'
END IF

ls_office_zip = This.GetItemString ( 1, 'office_zip' )
IF	IsNull ( ls_office_zip ) &
OR	Len ( Trim ( ls_office_zip ) ) < 1 THEN
	ls_office_zip = '%'
ELSE
	ls_office_zip = Trim ( ls_office_zip ) + '%'
END IF

ll_return =	&
	dw_office_list.Retrieve ( &
		ls_clntfranchise_clntid, &
		ls_office_brand, &
		ls_office_city, &
		ls_office_franchisenum, &
		ls_office_officename, &
		ls_office_region, &
		ls_office_state, &
		ls_office_zip &
		)

CHOOSE CASE ll_return
	CASE is < 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Offices.  Database error has occurred.' )
	CASE 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Offices for your criteria.' )
	CASE ELSE
		Return 1
END CHOOSE	

Return 1
end event

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Clear any entered criteria.
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
		// Trigger the event to retrieve Office list.
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

This.Tag = ''
end event

type st_office_search_critieria from statictext within w_add_franchisenumber
integer x = 32
integer y = 576
integer width = 3383
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
string text = "Enter Brand or Franchise Number, etc., and click Search for a list of Offices.  Case sensitive. Partial entries supported. No wild card (~'%~') needed."
boolean focusrectangle = false
end type

type cb_delete from u_cb within w_add_franchisenumber
boolean visible = false
integer x = 1083
integer y = 1644
integer width = 297
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Delete"
end type

event clicked;

Parent.Event Trigger pfe_delete()
end event

type cb_save from u_cb within w_add_franchisenumber
integer x = 1591
integer y = 1824
integer width = 297
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Save"
end type

event clicked;Return parent.Event Trigger pfc_save()
end event

type cb_close from u_cb within w_add_franchisenumber
integer x = 1952
integer y = 1824
integer width = 297
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Close"
end type

event clicked;close ( Parent )
end event

type cb_undelete from u_cb within w_add_franchisenumber
boolean visible = false
integer x = 1385
integer y = 1644
integer width = 297
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string text = "UnDelete"
end type

event clicked;parent.Event Trigger pfe_undelete()
end event

type cb_add from u_cb within w_add_franchisenumber
integer x = 882
integer y = 1824
integer width = 645
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Add Franchise Number"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Trigger the datawindow control event.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

dw_client_franchise_numbers.Event pfc_addrow ()

end event

type st_signed_office_list from statictext within w_add_franchisenumber
integer x = 1509
integer y = 16
integer width = 1957
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "To ~"delete~" a Franchise Number, enter an Assignment Effective End date."
alignment alignment = right!
boolean focusrectangle = false
end type


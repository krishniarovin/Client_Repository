$PBExportHeader$u_tab_client.sru
$PBExportComments$New 10/26/02.  Generic tab control.  Allows controls to be place on window and made visible/invisible depending on tab page selected.
forward
global type u_tab_client from u_tab
end type
type tabpage_1 from u_tabpg_client within u_tab_client
end type
type tabpage_1 from u_tabpg_client within u_tab_client
end type
type tabpage_2 from u_tabpg_client within u_tab_client
end type
type tabpage_2 from u_tabpg_client within u_tab_client
end type
type tabpage_3 from u_tabpg_client within u_tab_client
end type
type tabpage_3 from u_tabpg_client within u_tab_client
end type
type tabpage_4 from u_tabpg_client within u_tab_client
end type
type tabpage_4 from u_tabpg_client within u_tab_client
end type
type tabpage_5 from u_tabpg_client within u_tab_client
end type
type tabpage_5 from u_tabpg_client within u_tab_client
end type
type tabpage_6 from u_tabpg_client within u_tab_client
end type
type tabpage_6 from u_tabpg_client within u_tab_client
end type
end forward

global type u_tab_client from u_tab
boolean multiline = true
boolean powertips = true
boolean boldselectedtext = true
boolean createondemand = true
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
event type integer ue_settabcontrol ( )
end type
global u_tab_client u_tab_client

type variables
n_cst_tabpg_wiredobjects inv_wired[] //Autoinstantiated
end variables

forward prototypes
public function integer of_enabletab (integer ai_idx_tabpg)
public function integer of_disabletab (integer ai_idx_tabpg)
public function integer of_selecttab (integer ai_idx_tabpg)
public function integer of_getcurrenttab ()
public function integer of_wiretab (integer ai_idx_tabpg, graphicobject ago_object[])
public function integer of_wiretab (integer ai_idx_tabpg, u_dw adw_passed)
public function integer of_createtabs (string as_tabs[])
public function integer of_setwiredobjectvisibility (integer ai_idx_tabpg)
end prototypes

event ue_settabcontrol;///////////////////////////////////////////////////////////////////////
//
// Description:	Use this event to call the of_createtab () function.
//						Use this event to call the of_wiretab () function.
//
//	Returns:	Integer	1 Success
//							-1 Failure
// Example Script:
//
//			integer li_idx
//			integer li_max
//			string ls_tabs[]
//			graphicobject lgo_tabs[]
//			graphicobject lgo_null[]
//
//			// Start by making everything invisible.
//			li_max = UpperBound ( Parent.Control )
//			FOR li_idx = 1 to li_max
//				Parent.Control[li_idx].visible = False
//			NEXT
//			// Make the tab visible.
//			tab_1.visible 	= True
//
//			// Pass a string array containing a label for each tab page
//			// to the of_createtabs () function.
//			ls_tabs[1]	= 'Tab Page 1 Label'
//			ls_tabs[2]	= 'Tab Page 2 Label'
//			This.of_createtabs ( ls_tabs )
//			
//			// Call of_wiretab for each tab page identifying each control
//			// to be visible when the tab page is selected.
//			lgo_tabs		= lgo_null
//			lgo_tabs[1] = dw_1
//			lgo_tabs[2] = st_1
//			lgo_tabs[3] = cb_1
//			This.of_wiretab ( 1, lgo_tabs )
//
//			lgo_tabs		= lgo_null
//			lgo_tabs[1] = dw_2
//			lgo_tabs[2] = dw_3
//			This.of_wiretab ( 2, lgo_tabs )
//			
//			// Select the first tab page.
//			This.SelectedTab = 1
//
////////////////////////////////////////////////////////////////////////

Return 1
end event

public function integer of_enabletab (integer ai_idx_tabpg);////////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable the tabpage.
//
// Arguments:
//		ai_idx_tabpg	Index to the tabpg in this object's control array.
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

IF	IsNull ( ai_idx_tabpg ) THEN
	Return -1
END IF

IF	ai_idx_tabpg > UpperBound ( This.Control ) THEN
	Return -1
END IF

This.Control[ai_idx_tabpg].Enabled = True

Return 1
end function

public function integer of_disabletab (integer ai_idx_tabpg);////////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable the tabpage.
//
// Arguments:
//		ai_idx_tabpg	Index to the tabpg in this object's control array.
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

IF	IsNull ( ai_idx_tabpg ) THEN
	Return -1
END IF

IF	ai_idx_tabpg > UpperBound ( This.Control ) THEN
	Return -1
END IF

This.Control[ai_idx_tabpg].Enabled = False

Return 1
end function

public function integer of_selecttab (integer ai_idx_tabpg);////////////////////////////////////////////////////////////////////////////////
//
//!!	Description:	Force the selection of the pass tabpg.
//!!
//!!						DO NOT CALL THIS FUNCTION FROM THE SELECTIONCHANGING or
//!!							SELECTIONCHANGED EVENTS.  WE WILL LOOP.
// Arguments:
//		ai_idx_tabpg	Index to the tabpg in this object's control array.
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


// Select the tab page.
This.SelectedTab = ai_idx_tabpg

// Show the appropriate wired objects.
Return This.of_setwiredobjectvisibility ( ai_idx_tabpg )

end function

public function integer of_getcurrenttab ();////////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable the tabpage.
//
// Arguments:
//		None
//
//	Returns:
//		Integer			Index of currently active tabpage
//							-1	Failure
//
////////////////////////////////////////////////////////////////////////////////
//
// Revisions:
//
////////////////////////////////////////////////////////////////////////////////

IF	UpperBound ( This.Control ) < 1 THEN
	Return -1
END IF

Return This.SelectedTab
end function

public function integer of_wiretab (integer ai_idx_tabpg, graphicobject ago_object[]);////////////////////////////////////////////////////////////////////////////////
//
//	Description:		Save the array of passed objects in the 'wired' nvo.
//							Objects passed in this array will be used to Show()/Hide()
//							controls when the selection changes.
//
// Arguments:
//		ai_idx_tabpg	Index to the tabpg in this object's control array.
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

IF	IsNull ( ai_idx_tabpg ) THEN
	Return -1
END IF

IF	ai_idx_tabpg > UpperBound ( This.Control ) THEN
	Return -1
END IF

This.inv_wired[ai_idx_tabpg].igo_object = ago_object

Return 1
end function

public function integer of_wiretab (integer ai_idx_tabpg, u_dw adw_passed);////////////////////////////////////////////////////////////////////////////////
//
//	Description:		Save the array of passed objects in the 'wired' nvo.
//							U_dw passed will be used to Show()/Hide()
//							controls when the selection changes.
//
// Arguments:
//		ai_idx_tabpg	Index to the tabpg in this object's control array.
//		adw_passed		Datawindow control inherited from u_dw.
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

int li_max

IF	IsNull ( ai_idx_tabpg ) THEN
	Return -1
END IF

IF	ai_idx_tabpg > UpperBound ( This.Control ) THEN
	Return -1
END IF

IF	IsValid ( adw_passed ) THEN
ELSE
	Return -1
END IF

li_max = UpperBound ( This.inv_wired[ai_idx_tabpg].igo_object )

This.inv_wired[ai_idx_tabpg].igo_object[li_max + 1] = adw_passed

Return 1




end function

public function integer of_createtabs (string as_tabs[]);////////////////////////////////////////////////////////////////////////////////
//
//	Description:		Create a tabpage of type u_tabpg_client.
//							Add the text property from the passed string array.
//??	Enhancement:	Create the tabpg dynamically via 'create using'...
//??						This will allow developers to put logic in the created
//??						tab pages.
//
// Arguments:
//		as_tabs[]		String array containing text for each tabpage to be created.
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


int li_idx
int li_max
int li_max_control

li_max_control = UpperBound ( This.Control )
li_max			= UpperBound ( as_tabs )
IF	li_max > li_max_control THEN
	gnv_app.inv_error.of_message ( 'Programmer Error', &
		'Not enuf tab pages to satisfy request.~r~n' &
		+ ' Add at least ' + String ( li_max - li_max_control ) &
		+ ' more u_tabpg_client userobjects to u_tab_client.' )
	Return -1
END IF

// For each of the passed strings, put the tabpage in the table.
//	Make it visible.
FOR li_idx = 1 TO li_max
	IF	IsNull ( as_tabs[li_idx] ) THEN
		li_max = li_idx -1
		EXIT
	END IF
	This.Control[li_idx].Text 					= as_tabs[li_idx]
	This.Control[li_idx].Visible 				= True
	This.inv_wired[li_idx].is_tabpg_text	= as_tabs[li_idx]
NEXT

// Make the rest of the tabpgs invisible.
FOR li_idx = li_max + 1 TO li_max_control
	This.Control[li_idx].visible = False
NEXT

Return 1
end function

public function integer of_setwiredobjectvisibility (integer ai_idx_tabpg);////////////////////////////////////////////////////////////////////////////////
//
//!!	Description:	Make wired objects for the passed tab page visible.
//!!						Make wired objects for other tab pages invisible.
//
//!!						Call this function from the selectionchanging event
//!!							IF THE EVENT WILL ALLOW SELECTION TO CHANGE!
//
// Arguments:
//		ai_idx_tabpg	Index to the VISIBLE tabpg in this object's control array.
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

graphicobject lnv_objects[]
int li_oldindex
int li_idx_obj
int li_max_obj
u_tabpg_client lu_tabpg_client

IF	IsNull ( ai_idx_tabpg ) THEN
	Return -1
END IF

IF	ai_idx_tabpg > UpperBound ( This.Control ) THEN
	Return -1
END IF

// Hide all objects wired to the previous (currently selected) tab.
li_oldindex = This.SelectedTab
IF	UpperBound ( This.inv_wired ) > 0 &
AND li_oldindex > 0 THEN
	lnv_objects		= This.inv_wired[li_oldindex].igo_object
	li_max_obj		= UpperBound ( lnv_objects )
	FOR li_idx_obj = 1 TO li_max_obj
		lnv_objects[li_Idx_obj].Hide()
	NEXT
END IF

// Show the objects on the newly selected tab page.
IF	UpperBound ( This.inv_wired ) > 0 THEN
	lnv_objects		= This.inv_wired[ai_idx_tabpg].igo_object
	li_max_obj		= UpperBound ( lnv_objects )
	FOR li_idx_obj = 1 TO li_max_obj
		lnv_objects[li_Idx_obj].Show()
	NEXT
END IF

//??Later: Do the necessary setup on the new tab page.
//lu_tabpg_client = This.Control ( ai_idx_tabpg )
//IF	lu_tabpg_client.Event SelectionChanged () < 0 THEN
//	Return -1
//END IF

Return 1
end function

on u_tab_client.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_1
this.Control[iCurrent+2]=this.tabpage_2
this.Control[iCurrent+3]=this.tabpage_3
this.Control[iCurrent+4]=this.tabpage_4
this.Control[iCurrent+5]=this.tabpage_5
this.Control[iCurrent+6]=this.tabpage_6
end on

on u_tab_client.destroy
call super::destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

event selectionchanging;call super::selectionchanging;////////////////////////////////////////////////////////////////////////////////
//
//!!	Description:	Call This.of_setwiredobjectvisibility ( newindex )
//!!							from the this event
//!!							IF THE EVENT WILL ALLOW SELECTION TO CHANGE!
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

Return 0

end event

type tabpage_1 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type

type tabpage_2 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type

type tabpage_3 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type

type tabpage_4 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type

type tabpage_5 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type

type tabpage_6 from u_tabpg_client within u_tab_client
integer x = 18
integer y = 48
integer width = 859
integer height = 548
end type


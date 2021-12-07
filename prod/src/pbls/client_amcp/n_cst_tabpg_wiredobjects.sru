$PBExportHeader$n_cst_tabpg_wiredobjects.sru
$PBExportComments$New 10/26/02.  Array of objects 'wired' to a tab page.  Copied from PHHORCE.
forward
global type n_cst_tabpg_wiredobjects from nonvisualobject
end type
end forward

global type n_cst_tabpg_wiredobjects from nonvisualobject autoinstantiate
end type

type variables
graphicobject igo_object[]
string is_tabpg_text
end variables

on n_cst_tabpg_wiredobjects.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tabpg_wiredobjects.destroy
TriggerEvent( this, "destructor" )
end on


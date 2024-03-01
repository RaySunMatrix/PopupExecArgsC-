'' FreeBASIC binding for mingw-w64-v4.0.4
''
'' based on the C header files:
''   This Software is provided under the Zope Public License (ZPL) Version 2.1.
''
''   Copyright (c) 2009, 2010 by the mingw-w64 project
''
''   See the AUTHORS file for the list of contributors to the mingw-w64 project.
''
''   This license has been certified as open source. It has also been designated
''   as GPL compatible by the Free Software Foundation (FSF).
''
''   Redistribution and use in source and binary forms, with or without
''   modification, are permitted provided that the following conditions are met:
''
''     1. Redistributions in source code must retain the accompanying copyright
''        notice, this list of conditions, and the following disclaimer.
''     2. Redistributions in binary form must reproduce the accompanying
''        copyright notice, this list of conditions, and the following disclaimer
''        in the documentation and/or other materials provided with the
''        distribution.
''     3. Names of the copyright holders must not be used to endorse or promote
''        products derived from this software without prior written permission
''        from the copyright holders.
''     4. The right to distribute this software or to use it for any purpose does
''        not give you the right to use Servicemarks (sm) or Trademarks (tm) of
''        the copyright holders.  Use of them is covered by separate agreement
''        with the copyright holders.
''     5. If any files are modified, you must cause the modified files to carry
''        prominent notices stating that you changed the files and the date of
''        any change.
''
''   Disclaimer
''
''   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY EXPRESSED
''   OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
''   OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
''   EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT,
''   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
''   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
''   OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
''   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
''   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
''   EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "_mingw_unicode.bi"
#include once "wtypes.bi"
#include once "winapifamily.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define __ACCESS_CONTROL__
declare function AccFree alias "LocalFree"(byval hMem as HLOCAL) as HLOCAL

type _SE_OBJECT_TYPE as long
enum
	SE_UNKNOWN_OBJECT_TYPE = 0
	SE_FILE_OBJECT
	SE_SERVICE
	SE_PRINTER
	SE_REGISTRY_KEY
	SE_LMSHARE
	SE_KERNEL_OBJECT
	SE_WINDOW_OBJECT
	SE_DS_OBJECT
	SE_DS_OBJECT_ALL
	SE_PROVIDER_DEFINED_OBJECT
	SE_WMIGUID_OBJECT
	SE_REGISTRY_WOW64_32KEY
end enum

type SE_OBJECT_TYPE as _SE_OBJECT_TYPE

type _TRUSTEE_TYPE as long
enum
	TRUSTEE_IS_UNKNOWN
	TRUSTEE_IS_USER
	TRUSTEE_IS_GROUP
	TRUSTEE_IS_DOMAIN
	TRUSTEE_IS_ALIAS
	TRUSTEE_IS_WELL_KNOWN_GROUP
	TRUSTEE_IS_DELETED
	TRUSTEE_IS_INVALID
	TRUSTEE_IS_COMPUTER
end enum

type TRUSTEE_TYPE as _TRUSTEE_TYPE

type _TRUSTEE_FORM as long
enum
	TRUSTEE_IS_SID
	TRUSTEE_IS_NAME
	TRUSTEE_BAD_FORM
	TRUSTEE_IS_OBJECTS_AND_SID
	TRUSTEE_IS_OBJECTS_AND_NAME
end enum

type TRUSTEE_FORM as _TRUSTEE_FORM

type _MULTIPLE_TRUSTEE_OPERATION as long
enum
	NO_MULTIPLE_TRUSTEE
	TRUSTEE_IS_IMPERSONATE
end enum

type MULTIPLE_TRUSTEE_OPERATION as _MULTIPLE_TRUSTEE_OPERATION

type _OBJECTS_AND_SID
	ObjectsPresent as DWORD
	ObjectTypeGuid as GUID
	InheritedObjectTypeGuid as GUID
	pSid as SID ptr
end type

type OBJECTS_AND_SID as _OBJECTS_AND_SID
type POBJECTS_AND_SID as _OBJECTS_AND_SID ptr

type _OBJECTS_AND_NAME_A
	ObjectsPresent as DWORD
	ObjectType as SE_OBJECT_TYPE
	ObjectTypeName as LPSTR
	InheritedObjectTypeName as LPSTR
	ptstrName as LPSTR
end type

type OBJECTS_AND_NAME_A as _OBJECTS_AND_NAME_A
type POBJECTS_AND_NAME_A as _OBJECTS_AND_NAME_A ptr

type _OBJECTS_AND_NAME_W
	ObjectsPresent as DWORD
	ObjectType as SE_OBJECT_TYPE
	ObjectTypeName as LPWSTR
	InheritedObjectTypeName as LPWSTR
	ptstrName as LPWSTR
end type

type OBJECTS_AND_NAME_W as _OBJECTS_AND_NAME_W
type POBJECTS_AND_NAME_W as _OBJECTS_AND_NAME_W ptr

#ifdef UNICODE
	type OBJECTS_AND_NAME_ as OBJECTS_AND_NAME_W
	type POBJECTS_AND_NAME_ as POBJECTS_AND_NAME_W
#else
	type OBJECTS_AND_NAME_ as OBJECTS_AND_NAME_A
	type POBJECTS_AND_NAME_ as POBJECTS_AND_NAME_A
#endif

type _TRUSTEE_A
	pMultipleTrustee as _TRUSTEE_A ptr
	MultipleTrusteeOperation as MULTIPLE_TRUSTEE_OPERATION
	TrusteeForm as TRUSTEE_FORM
	TrusteeType as TRUSTEE_TYPE
	ptstrName as LPSTR
end type

type TRUSTEE_A as _TRUSTEE_A
type PTRUSTEE_A as _TRUSTEE_A ptr
type TRUSTEEA as _TRUSTEE_A
type PTRUSTEEA as _TRUSTEE_A ptr

type _TRUSTEE_W
	pMultipleTrustee as _TRUSTEE_W ptr
	MultipleTrusteeOperation as MULTIPLE_TRUSTEE_OPERATION
	TrusteeForm as TRUSTEE_FORM
	TrusteeType as TRUSTEE_TYPE
	ptstrName as LPWSTR
end type

type TRUSTEE_W as _TRUSTEE_W
type PTRUSTEE_W as _TRUSTEE_W ptr
type TRUSTEEW as _TRUSTEE_W
type PTRUSTEEW as _TRUSTEE_W ptr

#ifdef UNICODE
	type TRUSTEE_ as TRUSTEE_W
	type PTRUSTEE_ as PTRUSTEE_W
	type TRUSTEE as TRUSTEEW
	type PTRUSTEE as PTRUSTEEW
#else
	type TRUSTEE_ as TRUSTEE_A
	type PTRUSTEE_ as PTRUSTEE_A
	type TRUSTEE as TRUSTEEA
	type PTRUSTEE as PTRUSTEEA
#endif

type _ACCESS_MODE as long
enum
	NOT_USED_ACCESS = 0
	GRANT_ACCESS
	SET_ACCESS
	DENY_ACCESS
	REVOKE_ACCESS
	SET_AUDIT_SUCCESS
	SET_AUDIT_FAILURE
end enum

type ACCESS_MODE as _ACCESS_MODE
const NO_INHERITANCE = &h0
const SUB_OBJECTS_ONLY_INHERIT = &h1
const SUB_CONTAINERS_ONLY_INHERIT = &h2
const SUB_CONTAINERS_AND_OBJECTS_INHERIT = &h3
const INHERIT_NO_PROPAGATE = &h4
const INHERIT_ONLY = &h8
const INHERITED_ACCESS_ENTRY = &h10
const INHERITED_PARENT = &h10000000
const INHERITED_GRANDPARENT = &h20000000

type _EXPLICIT_ACCESS_A
	grfAccessPermissions as DWORD
	grfAccessMode as ACCESS_MODE
	grfInheritance as DWORD
	Trustee as TRUSTEE_A
end type

type EXPLICIT_ACCESS_A as _EXPLICIT_ACCESS_A
type PEXPLICIT_ACCESS_A as _EXPLICIT_ACCESS_A ptr
type EXPLICIT_ACCESSA as _EXPLICIT_ACCESS_A
type PEXPLICIT_ACCESSA as _EXPLICIT_ACCESS_A ptr

type _EXPLICIT_ACCESS_W
	grfAccessPermissions as DWORD
	grfAccessMode as ACCESS_MODE
	grfInheritance as DWORD
	Trustee as TRUSTEE_W
end type

type EXPLICIT_ACCESS_W as _EXPLICIT_ACCESS_W
type PEXPLICIT_ACCESS_W as _EXPLICIT_ACCESS_W ptr
type EXPLICIT_ACCESSW as _EXPLICIT_ACCESS_W
type PEXPLICIT_ACCESSW as _EXPLICIT_ACCESS_W ptr

#ifdef UNICODE
	type EXPLICIT_ACCESS_ as EXPLICIT_ACCESS_W
	type PEXPLICIT_ACCESS_ as PEXPLICIT_ACCESS_W
	type EXPLICIT_ACCESS as EXPLICIT_ACCESSW
	type PEXPLICIT_ACCESS as PEXPLICIT_ACCESSW
#else
	type EXPLICIT_ACCESS_ as EXPLICIT_ACCESS_A
	type PEXPLICIT_ACCESS_ as PEXPLICIT_ACCESS_A
	type EXPLICIT_ACCESS as EXPLICIT_ACCESSA
	type PEXPLICIT_ACCESS as PEXPLICIT_ACCESSA
#endif

#define ACCCTRL_DEFAULT_PROVIDERA "Windows NT Access Provider"
#define ACCCTRL_DEFAULT_PROVIDERW wstr("Windows NT Access Provider")

#ifdef UNICODE
	#define ACCCTRL_DEFAULT_PROVIDER ACCCTRL_DEFAULT_PROVIDERW
#else
	#define ACCCTRL_DEFAULT_PROVIDER ACCCTRL_DEFAULT_PROVIDERA
#endif

type ACCESS_RIGHTS as ULONG
type PACCESS_RIGHTS as ULONG ptr
type INHERIT_FLAGS as ULONG
type PINHERIT_FLAGS as ULONG ptr

type _ACTRL_ACCESS_ENTRYA
	Trustee as TRUSTEE_A
	fAccessFlags as ULONG
	Access as ACCESS_RIGHTS
	ProvSpecificAccess as ACCESS_RIGHTS
	Inheritance as INHERIT_FLAGS
	lpInheritProperty as LPSTR
end type

type ACTRL_ACCESS_ENTRYA as _ACTRL_ACCESS_ENTRYA
type PACTRL_ACCESS_ENTRYA as _ACTRL_ACCESS_ENTRYA ptr

type _ACTRL_ACCESS_ENTRYW
	Trustee as TRUSTEE_W
	fAccessFlags as ULONG
	Access as ACCESS_RIGHTS
	ProvSpecificAccess as ACCESS_RIGHTS
	Inheritance as INHERIT_FLAGS
	lpInheritProperty as LPWSTR
end type

type ACTRL_ACCESS_ENTRYW as _ACTRL_ACCESS_ENTRYW
type PACTRL_ACCESS_ENTRYW as _ACTRL_ACCESS_ENTRYW ptr

#ifdef UNICODE
	type ACTRL_ACCESS_ENTRY as ACTRL_ACCESS_ENTRYW
	type PACTRL_ACCESS_ENTRY as PACTRL_ACCESS_ENTRYW
#else
	type ACTRL_ACCESS_ENTRY as ACTRL_ACCESS_ENTRYA
	type PACTRL_ACCESS_ENTRY as PACTRL_ACCESS_ENTRYA
#endif

type _ACTRL_ACCESS_ENTRY_LISTA
	cEntries as ULONG
	pAccessList as ACTRL_ACCESS_ENTRYA ptr
end type

type ACTRL_ACCESS_ENTRY_LISTA as _ACTRL_ACCESS_ENTRY_LISTA
type PACTRL_ACCESS_ENTRY_LISTA as _ACTRL_ACCESS_ENTRY_LISTA ptr

type _ACTRL_ACCESS_ENTRY_LISTW
	cEntries as ULONG
	pAccessList as ACTRL_ACCESS_ENTRYW ptr
end type

type ACTRL_ACCESS_ENTRY_LISTW as _ACTRL_ACCESS_ENTRY_LISTW
type PACTRL_ACCESS_ENTRY_LISTW as _ACTRL_ACCESS_ENTRY_LISTW ptr

#ifdef UNICODE
	type ACTRL_ACCESS_ENTRY_LIST as ACTRL_ACCESS_ENTRY_LISTW
	type PACTRL_ACCESS_ENTRY_LIST as PACTRL_ACCESS_ENTRY_LISTW
#else
	type ACTRL_ACCESS_ENTRY_LIST as ACTRL_ACCESS_ENTRY_LISTA
	type PACTRL_ACCESS_ENTRY_LIST as PACTRL_ACCESS_ENTRY_LISTA
#endif

type _ACTRL_PROPERTY_ENTRYA
	lpProperty as LPSTR
	pAccessEntryList as PACTRL_ACCESS_ENTRY_LISTA
	fListFlags as ULONG
end type

type ACTRL_PROPERTY_ENTRYA as _ACTRL_PROPERTY_ENTRYA
type PACTRL_PROPERTY_ENTRYA as _ACTRL_PROPERTY_ENTRYA ptr

type _ACTRL_PROPERTY_ENTRYW
	lpProperty as LPWSTR
	pAccessEntryList as PACTRL_ACCESS_ENTRY_LISTW
	fListFlags as ULONG
end type

type ACTRL_PROPERTY_ENTRYW as _ACTRL_PROPERTY_ENTRYW
type PACTRL_PROPERTY_ENTRYW as _ACTRL_PROPERTY_ENTRYW ptr

#ifdef UNICODE
	type ACTRL_PROPERTY_ENTRY as ACTRL_PROPERTY_ENTRYW
	type PACTRL_PROPERTY_ENTRY as PACTRL_PROPERTY_ENTRYW
#else
	type ACTRL_PROPERTY_ENTRY as ACTRL_PROPERTY_ENTRYA
	type PACTRL_PROPERTY_ENTRY as PACTRL_PROPERTY_ENTRYA
#endif

type _ACTRL_ALISTA
	cEntries as ULONG
	pPropertyAccessList as PACTRL_PROPERTY_ENTRYA
end type

type ACTRL_ACCESSA as _ACTRL_ALISTA
type PACTRL_ACCESSA as _ACTRL_ALISTA ptr
type ACTRL_AUDITA as _ACTRL_ALISTA
type PACTRL_AUDITA as _ACTRL_ALISTA ptr

type _ACTRL_ALISTW
	cEntries as ULONG
	pPropertyAccessList as PACTRL_PROPERTY_ENTRYW
end type

type ACTRL_ACCESSW as _ACTRL_ALISTW
type PACTRL_ACCESSW as _ACTRL_ALISTW ptr
type ACTRL_AUDITW as _ACTRL_ALISTW
type PACTRL_AUDITW as _ACTRL_ALISTW ptr

#ifdef UNICODE
	type ACTRL_ACCESS as ACTRL_ACCESSW
	type PACTRL_ACCESS as PACTRL_ACCESSW
	type ACTRL_AUDIT as ACTRL_AUDITW
	type PACTRL_AUDIT as PACTRL_AUDITW
#else
	type ACTRL_ACCESS as ACTRL_ACCESSA
	type PACTRL_ACCESS as PACTRL_ACCESSA
	type ACTRL_AUDIT as ACTRL_AUDITA
	type PACTRL_AUDIT as PACTRL_AUDITA
#endif

const TRUSTEE_ACCESS_ALLOWED = &h1
const TRUSTEE_ACCESS_READ = &h2
const TRUSTEE_ACCESS_WRITE = &h4
const TRUSTEE_ACCESS_EXPLICIT = &h1
const TRUSTEE_ACCESS_READ_WRITE = TRUSTEE_ACCESS_READ or TRUSTEE_ACCESS_WRITE
const TRUSTEE_ACCESS_ALL = &hffffffff

type _TRUSTEE_ACCESSA
	lpProperty as LPSTR
	Access as ACCESS_RIGHTS
	fAccessFlags as ULONG
	fReturnedAccess as ULONG
end type

type TRUSTEE_ACCESSA as _TRUSTEE_ACCESSA
type PTRUSTEE_ACCESSA as _TRUSTEE_ACCESSA ptr

type _TRUSTEE_ACCESSW
	lpProperty as LPWSTR
	Access as ACCESS_RIGHTS
	fAccessFlags as ULONG
	fReturnedAccess as ULONG
end type

type TRUSTEE_ACCESSW as _TRUSTEE_ACCESSW
type PTRUSTEE_ACCESSW as _TRUSTEE_ACCESSW ptr

#ifdef UNICODE
	type TRUSTEE_ACCESS as TRUSTEE_ACCESSW
	type PTRUSTEE_ACCESS as PTRUSTEE_ACCESSW
#else
	type TRUSTEE_ACCESS as TRUSTEE_ACCESSA
	type PTRUSTEE_ACCESS as PTRUSTEE_ACCESSA
#endif

const ACTRL_RESERVED = &h00000000
const ACTRL_PERM_1 = &h00000001
const ACTRL_PERM_2 = &h00000002
const ACTRL_PERM_3 = &h00000004
const ACTRL_PERM_4 = &h00000008
const ACTRL_PERM_5 = &h00000010
const ACTRL_PERM_6 = &h00000020
const ACTRL_PERM_7 = &h00000040
const ACTRL_PERM_8 = &h00000080
const ACTRL_PERM_9 = &h00000100
const ACTRL_PERM_10 = &h00000200
const ACTRL_PERM_11 = &h00000400
const ACTRL_PERM_12 = &h00000800
const ACTRL_PERM_13 = &h00001000
const ACTRL_PERM_14 = &h00002000
const ACTRL_PERM_15 = &h00004000
const ACTRL_PERM_16 = &h00008000
const ACTRL_PERM_17 = &h00010000
const ACTRL_PERM_18 = &h00020000
const ACTRL_PERM_19 = &h00040000
const ACTRL_PERM_20 = &h00080000
const ACTRL_ACCESS_ALLOWED = &h00000001
const ACTRL_ACCESS_DENIED = &h00000002
const ACTRL_AUDIT_SUCCESS = &h00000004
const ACTRL_AUDIT_FAILURE = &h00000008
const ACTRL_ACCESS_PROTECTED = &h00000001
const ACTRL_SYSTEM_ACCESS = &h04000000
const ACTRL_DELETE = &h08000000
const ACTRL_READ_CONTROL = &h10000000
const ACTRL_CHANGE_ACCESS = &h20000000
const ACTRL_CHANGE_OWNER = &h40000000
const ACTRL_SYNCHRONIZE = &h80000000
const ACTRL_STD_RIGHTS_ALL = &hf8000000
const ACTRL_STD_RIGHT_REQUIRED = ACTRL_STD_RIGHTS_ALL and (not ACTRL_SYNCHRONIZE)
#define _DS_CONTROL_BITS_DEFINED_
const ACTRL_DS_OPEN = ACTRL_RESERVED
const ACTRL_DS_CREATE_CHILD = ACTRL_PERM_1
const ACTRL_DS_DELETE_CHILD = ACTRL_PERM_2
const ACTRL_DS_LIST = ACTRL_PERM_3
const ACTRL_DS_SELF = ACTRL_PERM_4
const ACTRL_DS_READ_PROP = ACTRL_PERM_5
const ACTRL_DS_WRITE_PROP = ACTRL_PERM_6
const ACTRL_DS_DELETE_TREE = ACTRL_PERM_7
const ACTRL_DS_LIST_OBJECT = ACTRL_PERM_8
const ACTRL_DS_CONTROL_ACCESS = ACTRL_PERM_9
const ACTRL_FILE_READ = ACTRL_PERM_1
const ACTRL_FILE_WRITE = ACTRL_PERM_2
const ACTRL_FILE_APPEND = ACTRL_PERM_3
const ACTRL_FILE_READ_PROP = ACTRL_PERM_4
const ACTRL_FILE_WRITE_PROP = ACTRL_PERM_5
const ACTRL_FILE_EXECUTE = ACTRL_PERM_6
const ACTRL_FILE_READ_ATTRIB = ACTRL_PERM_8
const ACTRL_FILE_WRITE_ATTRIB = ACTRL_PERM_9
const ACTRL_FILE_CREATE_PIPE = ACTRL_PERM_10
const ACTRL_DIR_LIST = ACTRL_PERM_1
const ACTRL_DIR_CREATE_OBJECT = ACTRL_PERM_2
const ACTRL_DIR_CREATE_CHILD = ACTRL_PERM_3
const ACTRL_DIR_DELETE_CHILD = ACTRL_PERM_7
const ACTRL_DIR_TRAVERSE = ACTRL_PERM_6
const ACTRL_KERNEL_TERMINATE = ACTRL_PERM_1
const ACTRL_KERNEL_THREAD = ACTRL_PERM_2
const ACTRL_KERNEL_VM = ACTRL_PERM_3
const ACTRL_KERNEL_VM_READ = ACTRL_PERM_4
const ACTRL_KERNEL_VM_WRITE = ACTRL_PERM_5
const ACTRL_KERNEL_DUP_HANDLE = ACTRL_PERM_6
const ACTRL_KERNEL_PROCESS = ACTRL_PERM_7
const ACTRL_KERNEL_SET_INFO = ACTRL_PERM_8
const ACTRL_KERNEL_GET_INFO = ACTRL_PERM_9
const ACTRL_KERNEL_CONTROL = ACTRL_PERM_10
const ACTRL_KERNEL_ALERT = ACTRL_PERM_11
const ACTRL_KERNEL_GET_CONTEXT = ACTRL_PERM_12
const ACTRL_KERNEL_SET_CONTEXT = ACTRL_PERM_13
const ACTRL_KERNEL_TOKEN = ACTRL_PERM_14
const ACTRL_KERNEL_IMPERSONATE = ACTRL_PERM_15
const ACTRL_KERNEL_DIMPERSONATE = ACTRL_PERM_16
const ACTRL_PRINT_SADMIN = ACTRL_PERM_1
const ACTRL_PRINT_SLIST = ACTRL_PERM_2
const ACTRL_PRINT_PADMIN = ACTRL_PERM_3
const ACTRL_PRINT_PUSE = ACTRL_PERM_4
const ACTRL_PRINT_JADMIN = ACTRL_PERM_5
const ACTRL_SVC_GET_INFO = ACTRL_PERM_1
const ACTRL_SVC_SET_INFO = ACTRL_PERM_2
const ACTRL_SVC_STATUS = ACTRL_PERM_3
const ACTRL_SVC_LIST = ACTRL_PERM_4
const ACTRL_SVC_START = ACTRL_PERM_5
const ACTRL_SVC_STOP = ACTRL_PERM_6
const ACTRL_SVC_PAUSE = ACTRL_PERM_7
const ACTRL_SVC_INTERROGATE = ACTRL_PERM_8
const ACTRL_SVC_UCONTROL = ACTRL_PERM_9
const ACTRL_REG_QUERY = ACTRL_PERM_1
const ACTRL_REG_SET = ACTRL_PERM_2
const ACTRL_REG_CREATE_CHILD = ACTRL_PERM_3
const ACTRL_REG_LIST = ACTRL_PERM_4
const ACTRL_REG_NOTIFY = ACTRL_PERM_5
const ACTRL_REG_LINK = ACTRL_PERM_6
const ACTRL_WIN_CLIPBRD = ACTRL_PERM_1
const ACTRL_WIN_GLOBAL_ATOMS = ACTRL_PERM_2
const ACTRL_WIN_CREATE = ACTRL_PERM_3
const ACTRL_WIN_LIST_DESK = ACTRL_PERM_4
const ACTRL_WIN_LIST = ACTRL_PERM_5
const ACTRL_WIN_READ_ATTRIBS = ACTRL_PERM_6
const ACTRL_WIN_WRITE_ATTRIBS = ACTRL_PERM_7
const ACTRL_WIN_SCREEN = ACTRL_PERM_8
const ACTRL_WIN_EXIT = ACTRL_PERM_9

type _ACTRL_OVERLAPPED
	union
		Provider as PVOID
		Reserved1 as ULONG
	end union

	Reserved2 as ULONG
	hEvent as HANDLE
end type

type ACTRL_OVERLAPPED as _ACTRL_OVERLAPPED
type PACTRL_OVERLAPPED as _ACTRL_OVERLAPPED ptr

type _ACTRL_ACCESS_INFOA
	fAccessPermission as ULONG
	lpAccessPermissionName as LPSTR
end type

type ACTRL_ACCESS_INFOA as _ACTRL_ACCESS_INFOA
type PACTRL_ACCESS_INFOA as _ACTRL_ACCESS_INFOA ptr

type _ACTRL_ACCESS_INFOW
	fAccessPermission as ULONG
	lpAccessPermissionName as LPWSTR
end type

type ACTRL_ACCESS_INFOW as _ACTRL_ACCESS_INFOW
type PACTRL_ACCESS_INFOW as _ACTRL_ACCESS_INFOW ptr

#ifdef UNICODE
	type ACTRL_ACCESS_INFO as ACTRL_ACCESS_INFOW
	type PACTRL_ACCESS_INFO as PACTRL_ACCESS_INFOW
#else
	type ACTRL_ACCESS_INFO as ACTRL_ACCESS_INFOA
	type PACTRL_ACCESS_INFO as PACTRL_ACCESS_INFOA
#endif

type _ACTRL_CONTROL_INFOA
	lpControlId as LPSTR
	lpControlName as LPSTR
end type

type ACTRL_CONTROL_INFOA as _ACTRL_CONTROL_INFOA
type PACTRL_CONTROL_INFOA as _ACTRL_CONTROL_INFOA ptr

type _ACTRL_CONTROL_INFOW
	lpControlId as LPWSTR
	lpControlName as LPWSTR
end type

type ACTRL_CONTROL_INFOW as _ACTRL_CONTROL_INFOW
type PACTRL_CONTROL_INFOW as _ACTRL_CONTROL_INFOW ptr

#ifdef UNICODE
	type ACTRL_CONTROL_INFO as ACTRL_CONTROL_INFOW
	type PACTRL_CONTROL_INFO as PACTRL_CONTROL_INFOW
#else
	type ACTRL_CONTROL_INFO as ACTRL_CONTROL_INFOA
	type PACTRL_CONTROL_INFO as PACTRL_CONTROL_INFOA
#endif

const ACTRL_ACCESS_NO_OPTIONS = &h0
const ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES = &h1

#if _WIN32_WINNT >= &h0600
	const TREE_SEC_INFO_SET = &h00000001
	const TREE_SEC_INFO_RESET = &h00000002
	const TREE_SEC_INFO_RESET_KEEP_EXPLICIT = &h00000003
#endif

type _PROGRESS_INVOKE_SETTING as long
enum
	ProgressInvokeNever = 1
	ProgressInvokeEveryObject
	ProgressInvokeOnError
	ProgressCancelOperation
	ProgressRetryOperation

	#if _WIN32_WINNT >= &h0600
		ProgressInvokePrePostError
	#endif
end enum

type PROG_INVOKE_SETTING as _PROGRESS_INVOKE_SETTING
type PPROG_INVOKE_SETTING as _PROGRESS_INVOKE_SETTING ptr

type _FN_OBJECT_MGR_FUNCTIONS
	Placeholder as ULONG
end type

type FN_OBJECT_MGR_FUNCTS as _FN_OBJECT_MGR_FUNCTIONS
type PFN_OBJECT_MGR_FUNCTS as _FN_OBJECT_MGR_FUNCTIONS ptr

type _INHERITED_FROMA
	GenerationGap as LONG
	AncestorName as LPSTR
end type

type INHERITED_FROMA as _INHERITED_FROMA
type PINHERITED_FROMA as _INHERITED_FROMA ptr

type _INHERITED_FROMW
	GenerationGap as LONG
	AncestorName as LPWSTR
end type

type INHERITED_FROMW as _INHERITED_FROMW
type PINHERITED_FROMW as _INHERITED_FROMW ptr

#ifdef UNICODE
	type INHERITED_FROM as INHERITED_FROMW
	type PINHERITED_FROM as PINHERITED_FROMW
#else
	type INHERITED_FROM as INHERITED_FROMA
	type PINHERITED_FROM as PINHERITED_FROMA
#endif

end extern

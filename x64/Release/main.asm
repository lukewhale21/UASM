; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
COMM	ZEROLOCALS:BYTE
_DATA	ENDS
_BSS	SEGMENT
$SG8072	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG8070	DB	'HJWASM', 00H
	ORG $+1
$SG8076	DB	'%s', 00H
_DATA	ENDS
PUBLIC	__local_stdio_printf_options
PUBLIC	printf
PUBLIC	main
EXTRN	signal:PROC
EXTRN	__acrt_iob_func:PROC
EXTRN	__stdio_common_vfprintf:PROC
EXTRN	exit:PROC
EXTRN	getenv:PROC
EXTRN	EmitError:PROC
EXTRN	EmitErr:PROC
EXTRN	ErrnoStr:PROC
EXTRN	write_logo:PROC
EXTRN	AssembleModule:PROC
EXTRN	close_files:PROC
EXTRN	MsgGetEx:PROC
EXTRN	ParseCmdline:PROC
EXTRN	CmdlineFini:PROC
EXTRN	GetFNamePart:PROC
EXTRN	_findclose:PROC
EXTRN	_findfirst64i32:PROC
EXTRN	_findnext64i32:PROC
EXTRN	memcpy:PROC
EXTRN	Options:BYTE
_DATA	SEGMENT
COMM	?_OptionsStorage@?1??__local_stdio_printf_options@@9@9:QWORD							; `__local_stdio_printf_options'::`2'::_OptionsStorage
_DATA	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$_vfprintf_l DD imagerel $LN4
	DD	imagerel $LN4+80
	DD	imagerel $unwind$_vfprintf_l
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$printf DD imagerel $LN6
	DD	imagerel $LN6+83
	DD	imagerel $unwind$printf
pdata	ENDS
pdata	SEGMENT
$pdata$genfailure DD imagerel genfailure
	DD	imagerel genfailure+35
	DD	imagerel $unwind$genfailure
$pdata$main DD	imagerel $LN28
	DD	imagerel $LN28+14
	DD	imagerel $unwind$main
$pdata$0$main DD imagerel $LN28+14
	DD	imagerel $LN28+110
	DD	imagerel $chain$0$main
$pdata$2$main DD imagerel $LN28+110
	DD	imagerel $LN28+363
	DD	imagerel $chain$2$main
$pdata$3$main DD imagerel $LN28+363
	DD	imagerel $LN28+386
	DD	imagerel $chain$3$main
$pdata$4$main DD imagerel $LN28+386
	DD	imagerel $LN28+459
	DD	imagerel $chain$4$main
pdata	ENDS
xdata	SEGMENT
$unwind$genfailure DD 010401H
	DD	04204H
$unwind$main DD	040c01H
	DD	04d010cH
	DD	050046005H
$chain$0$main DD 020421H
	DD	04ce404H
	DD	imagerel $LN28
	DD	imagerel $LN28+14
	DD	imagerel $unwind$main
$chain$2$main DD 041021H
	DD	0527410H
	DD	0503408H
	DD	imagerel $LN28+14
	DD	imagerel $LN28+110
	DD	imagerel $chain$0$main
$chain$3$main DD 021H
	DD	imagerel $LN28+14
	DD	imagerel $LN28+110
	DD	imagerel $chain$0$main
$chain$4$main DD 021H
	DD	imagerel $LN28
	DD	imagerel $LN28+14
	DD	imagerel $unwind$main
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$printf DD 041b01H
	DD	07017521bH
	DD	030156016H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$_vfprintf_l DD 081401H
	DD	0a6414H
	DD	095414H
	DD	083414H
	DD	070105214H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\main.c
_TEXT	SEGMENT
finfo$ = 32
fname$ = 336
argc$ = 640
numArgs$ = 648
argv$ = 648
main	PROC

; 62   : {

$LN28:
	mov	rax, rsp
	push	rbp
	push	rsi
	sub	rsp, 616				; 00000268H

; 63   : 	char    *pEnv;
; 64   : 	int     numArgs = 0;

	xor	ebp, ebp
	mov	QWORD PTR [rax-24], r14

; 65   : 	int     numFiles = 0;
; 66   : 	int     rc = 0;
; 67   : 
; 68   : #if WILDCARDS
; 69   : 	/* v2.11: _findfirst/next/close() handle, should be of type intptr_t.
; 70   : 	* since this type isn't necessarily defined, type long is used as substitute.
; 71   : 	*/
; 72   : 
; 73   : 	size_t    fh;
; 74   : 	const char *pfn;
; 75   : 	int     dirsize;
; 76   : 	struct  _finddata_t finfo;
; 77   : 	char    fname[FILENAME_MAX];
; 78   : #endif
; 79   : 
; 80   : #if 0 //def DEBUG_OUT    /* DebugMsg() cannot be used that early */
; 81   : 	int i;
; 82   : 	for ( i = 1; i < argc; i++ ) {
; 83   : 		printf("argv[%u]=>%s<\n", i, argv[i] );
; 84   : 	}
; 85   : #endif
; 86   : 
; 87   : #ifdef TRMEM
; 88   : 	tm_Init();
; 89   : #endif
; 90   : 
; 91   : 	pEnv = getenv("HJWASM");

	lea	rcx, OFFSET FLAT:$SG8070
	mov	DWORD PTR [rax+16], ebp
	mov	esi, ebp
	mov	r14, rdx
	call	getenv

; 92   : 	if (pEnv == NULL)

	test	rax, rax
	lea	rcx, OFFSET FLAT:$SG8072

; 93   : 		pEnv = "";
; 94   : 	argv[0] = pEnv;
; 95   : 
; 96   : #ifndef DEBUG_OUT
; 97   : 	signal(SIGSEGV, genfailure);

	lea	rdx, OFFSET FLAT:genfailure
	cmovne	rcx, rax
	mov	QWORD PTR [r14], rcx
	lea	ecx, QWORD PTR [rbp+11]
	call	signal

; 98   : #endif
; 99   : 
; 100  : #if CATCHBREAK
; 101  : 	signal(SIGBREAK, genfailure);

	lea	rdx, OFFSET FLAT:genfailure
	lea	ecx, QWORD PTR [rbp+21]
	call	signal

; 102  : #else
; 103  : 	signal(SIGTERM, genfailure);
; 104  : #endif
; 105  : 	/* ParseCmdLine() returns NULL if no source file name has been found (anymore) */
; 106  : 	while (ParseCmdline((const char **)argv, &numArgs)) {

	lea	rdx, QWORD PTR numArgs$[rsp]
	mov	rcx, r14
	call	ParseCmdline
	test	rax, rax
	je	$LN3@main
	mov	QWORD PTR [rsp+640], rbx
	mov	QWORD PTR [rsp+656], rdi
	npad	2
$LL2@main:

; 107  : 		numFiles++;

	inc	ebp

; 108  : 		write_logo();

	call	write_logo

; 109  : #if WILDCARDS
; 110  : 		if ((fh = _findfirst(Options.names[ASM], &finfo)) == -1) {

	mov	rcx, QWORD PTR Options+16
	lea	rdx, QWORD PTR finfo$[rsp]
	call	_findfirst64i32
	mov	rdi, rax
	cmp	rax, -1
	je	$LN17@main

; 113  : 			break;
; 114  : 		}
; 115  : 		/* v2.12: _splitpath()/_makepath() removed */
; 116  : 		//_splitpath( Options.names[ASM], drv, dir, NULL, NULL );
; 117  : 		//DebugMsg(("main: _splitpath(%s): drv=\"%s\" dir=\"%s\"\n", Options.names[ASM], drv, dir ));
; 118  : 		pfn = GetFNamePart(Options.names[ASM]);

	mov	rcx, QWORD PTR Options+16
	call	GetFNamePart

; 119  : 		dirsize = pfn - Options.names[ASM];

	mov	rdx, QWORD PTR Options+16

; 120  : 		memcpy(fname, Options.names[ASM], dirsize);

	lea	rcx, QWORD PTR fname$[rsp]
	sub	eax, edx
	movsxd	rbx, eax
	mov	r8, rbx
	call	memcpy
	lea	rax, QWORD PTR finfo$[rsp+36]
	sub	rbx, rax
	lea	rbx, QWORD PTR fname$[rsp+rbx]
	npad	3
$LL6@main:

; 121  : 			do {
; 122  : 				/* v2.12: _splitpath()/_makepath() removed */
; 123  : 				//_makepath( fname, drv, dir, finfo.name, NULL );
; 124  : 				//DebugMsg(("main: _makepath(\"%s\", \"%s\", \"%s\")=\"%s\"\n", drv, dir, finfo.name, fname ));
; 125  : 				strcpy(&fname[dirsize], finfo.name);

	lea	rax, QWORD PTR finfo$[rsp+36]
	npad	11
$LL13@main:
	movzx	ecx, BYTE PTR [rax]
	mov	BYTE PTR [rbx+rax], cl
	lea	rax, QWORD PTR [rax+1]
	test	cl, cl
	jne	SHORT $LL13@main

; 126  : 				DebugMsg(("main: fname=%s\n", fname));
; 127  : 				rc = AssembleModule(fname);  /* assemble 1 module */

	lea	rcx, QWORD PTR fname$[rsp]
	call	AssembleModule

; 128  : 			} while ((_findnext(fh, &finfo) != -1));

	lea	rdx, QWORD PTR finfo$[rsp]
	mov	rcx, rdi
	mov	esi, eax
	call	_findnext64i32
	cmp	eax, -1
	jne	SHORT $LL6@main

; 129  : 		    _findclose(fh);

	mov	rcx, rdi
	call	_findclose
	lea	rdx, QWORD PTR numArgs$[rsp]
	mov	rcx, r14
	call	ParseCmdline
	test	rax, rax
	jne	$LL2@main

; 109  : #if WILDCARDS
; 110  : 		if ((fh = _findfirst(Options.names[ASM], &finfo)) == -1) {

	jmp	SHORT $LN26@main
$LN17@main:

; 111  : 			DebugMsg(("main: _findfirst(%s) failed\n", Options.names[ASM]));
; 112  : 			EmitErr(CANNOT_OPEN_FILE, Options.names[ASM], ErrnoStr());

	call	ErrnoStr
	mov	rdx, QWORD PTR Options+16
	mov	r8, rax
	mov	ecx, 106				; 0000006aH
	call	EmitErr
$LN26@main:
	mov	rbx, QWORD PTR [rsp+640]
	mov	rdi, QWORD PTR [rsp+656]
$LN3@main:

; 130  : #else
; 131  : 		rc = AssembleModule( Options.names[ASM] );
; 132  : #endif
; 133  : 	};
; 134  : 	CmdlineFini();

	call	CmdlineFini

; 135  : 	if (numArgs == 0) {

	cmp	DWORD PTR numArgs$[rsp], 0
	mov	r14, QWORD PTR [rsp+608]
	jne	SHORT $LN9@main

; 136  : 		write_logo();

	call	write_logo

; 137  : 		printf("%s", MsgGetEx(MSG_USAGE));

	xor	ecx, ecx
	call	MsgGetEx
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:$SG8076
	call	printf

; 141  : 
; 142  : #ifdef TRMEM
; 143  : 	tm_Fini();
; 144  : #endif
; 145  : 
; 146  : 	DebugMsg(("main: exit, return code=%u\n", 1 - rc));
; 147  : 	return(1 - rc); /* zero if no errors */

	mov	eax, 1
	sub	eax, esi

; 148  : }

	add	rsp, 616				; 00000268H
	pop	rsi
	pop	rbp
	ret	0
$LN9@main:

; 138  : 	}
; 139  : 	else if (numFiles == 0)

	test	ebp, ebp
	jne	SHORT $LN11@main

; 140  : 		EmitError(NO_FILENAME_SPECIFIED);

	lea	ecx, QWORD PTR [rbp+104]
	call	EmitError
$LN11@main:

; 141  : 
; 142  : #ifdef TRMEM
; 143  : 	tm_Fini();
; 144  : #endif
; 145  : 
; 146  : 	DebugMsg(("main: exit, return code=%u\n", 1 - rc));
; 147  : 	return(1 - rc); /* zero if no errors */

	mov	eax, 1
	sub	eax, esi

; 148  : }

	add	rsp, 616				; 00000268H
	pop	rsi
	pop	rbp
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\main.c
_TEXT	SEGMENT
signo$ = 48
genfailure PROC

; 50   : {

	sub	rsp, 40					; 00000028H

; 51   : #if CATCHBREAK
; 52   :     if (signo != SIGBREAK)

	cmp	ecx, 21
	je	SHORT $LN2@genfailure

; 53   : #else
; 54   :     if (signo != SIGTERM)
; 55   : #endif
; 56   :         EmitError( GENERAL_FAILURE );

	mov	ecx, 168				; 000000a8H
	call	EmitError
$LN2@genfailure:

; 57   :     close_files();

	call	close_files

; 58   :     exit( EXIT_FAILURE );

	mov	ecx, 1
	call	exit
	int	3
$LN4@genfailure:
genfailure ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\stdio.h
;	COMDAT printf
_TEXT	SEGMENT
_Format$ = 80
printf	PROC						; COMDAT

; 950  : {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	push	rbx
	push	rsi
	push	rdi
	sub	rsp, 48					; 00000030H
	mov	rdi, rcx

; 951  :     int _Result;
; 952  :     va_list _ArgList;
; 953  :     __crt_va_start(_ArgList, _Format);

	lea	rsi, QWORD PTR _Format$[rsp+8]

; 954  :     _Result = _vfprintf_l(stdout, _Format, NULL, _ArgList);

	mov	ecx, 1
	call	__acrt_iob_func
	mov	rbx, rax
	call	__local_stdio_printf_options
	xor	r9d, r9d
	mov	QWORD PTR [rsp+32], rsi
	mov	r8, rdi
	mov	rdx, rbx
	mov	rcx, QWORD PTR [rax]
	call	__stdio_common_vfprintf

; 955  :     __crt_va_end(_ArgList);
; 956  :     return _Result;
; 957  : }

	add	rsp, 48					; 00000030H
	pop	rdi
	pop	rsi
	pop	rbx
	ret	0
printf	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\stdio.h
;	COMDAT _vfprintf_l
_TEXT	SEGMENT
_Stream$ = 64
_Format$ = 72
_Locale$ = 80
_ArgList$ = 88
_vfprintf_l PROC					; COMDAT

; 638  : {

$LN4:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rbp
	mov	QWORD PTR [rsp+24], rsi
	push	rdi
	sub	rsp, 48					; 00000030H
	mov	rbx, r9
	mov	rdi, r8
	mov	rsi, rdx
	mov	rbp, rcx

; 639  :     return __stdio_common_vfprintf(_CRT_INTERNAL_LOCAL_PRINTF_OPTIONS, _Stream, _Format, _Locale, _ArgList);

	call	__local_stdio_printf_options
	mov	r9, rdi
	mov	QWORD PTR [rsp+32], rbx
	mov	r8, rsi
	mov	rdx, rbp
	mov	rcx, QWORD PTR [rax]
	call	__stdio_common_vfprintf

; 640  : }

	mov	rbx, QWORD PTR [rsp+64]
	mov	rbp, QWORD PTR [rsp+72]
	mov	rsi, QWORD PTR [rsp+80]
	add	rsp, 48					; 00000030H
	pop	rdi
	ret	0
_vfprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\corecrt_stdio_config.h
;	COMDAT __local_stdio_printf_options
_TEXT	SEGMENT
__local_stdio_printf_options PROC			; COMDAT

; 74   :     static unsigned __int64 _OptionsStorage;
; 75   :     return &_OptionsStorage;

	lea	rax, OFFSET FLAT:?_OptionsStorage@?1??__local_stdio_printf_options@@9@9 ; `__local_stdio_printf_options'::`2'::_OptionsStorage

; 76   : }

	ret	0
__local_stdio_printf_options ENDP
_TEXT	ENDS
END

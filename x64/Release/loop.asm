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
$SG10988 DB	01H DUP (?)
_BSS	ENDS
PUBLIC	LoopDirective
EXTRN	isalpha:PROC
EXTRN	isspace:PROC
EXTRN	EmitError:PROC
EXTRN	EmitErr:PROC
EXTRN	get_curr_srcfile:PROC
EXTRN	EvalOperand:PROC
EXTRN	Tokenize:PROC
EXTRN	RunMacro:PROC
EXTRN	ReleaseMacroData:PROC
EXTRN	StoreMacro:PROC
EXTRN	LstWriteSrcLine:PROC
EXTRN	__chkstk:PROC
EXTRN	memcpy:PROC
EXTRN	memset:PROC
EXTRN	ModuleInfo:BYTE
pdata	SEGMENT
$pdata$LoopDirective DD imagerel $LN117
	DD	imagerel $LN117+1969
	DD	imagerel $unwind$LoopDirective
pdata	ENDS
xdata	SEGMENT
$unwind$LoopDirective DD 0350c2b01H
	DD	033342bH
	DD	0116331bH
	DD	0f00f0028H
	DD	0d00be00dH
	DD	07007c009H
	DD	050056006H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\loop.c
_TEXT	SEGMENT
macinfo$ = 0
tmpmacro$ = 32
opnd$ = 160
arg_loc$ = 336
i$ = 336
is_exitm$ = 344
parmstring$ = 344
tokenarray$ = 344
buffer$ = 352
LoopDirective PROC

; 26   : {

$LN117:
	mov	DWORD PTR [rsp+8], ecx
	push	rbp
	push	rsi
	push	rdi
	push	r12
	push	r13
	push	r14
	push	r15
	sub	rsp, 320				; 00000140H
	lea	rbp, QWORD PTR [rsp+48]
	movsxd	r14, ecx
	mov	rdi, rdx

; 27   :     int directive = tokenarray[i].tokval;

	mov	rax, r14
	mov	QWORD PTR [rbp+360], rbx
	shl	rax, 5

; 28   :     int arg_loc;
; 29   :     int len;
; 30   :     //int skipcomma;
; 31   :     char *parmstring;
; 32   :     char *ptr;
; 33   :     struct dsym *macro;
; 34   :     bool is_exitm;
; 35   :     struct expr opnd;
; 36   :     struct macro_info macinfo;
; 37   :     struct dsym tmpmacro;
; 38   : #ifdef DEBUG_OUT
; 39   :     uint_32 count = 0;
; 40   : #endif
; 41   :     /* v2.08: use myalloca() to get space to store the argument */
; 42   :     //char line[MAX_LINE_LEN];
; 43   :     char buffer[4];
; 44   : 
; 45   :     DebugMsg1(("LoopDirective(%s) enter\n", GetResWName( directive, NULL ) ));
; 46   : 
; 47   :     i++; /* skip directive */

	inc	r14d

; 48   :     if ( ModuleInfo.list == TRUE ) LstWriteSrcLine();

	test	DWORD PTR ModuleInfo+408, 2048		; 00000800H
	mov	r15d, DWORD PTR [rax+rdx+16]
	mov	DWORD PTR i$[rbp], r14d
	je	SHORT $LN23@LoopDirect
	call	LstWriteSrcLine
	mov	r14d, DWORD PTR i$[rbp]
$LN23@LoopDirect:

; 49   : 
; 50   :     switch ( directive ) {

	xor	r13d, r13d
	cmp	r15d, 393				; 00000189H
	jl	SHORT $LN31@LoopDirect
	cmp	r15d, 394				; 0000018aH
	jle	SHORT $LN108@LoopDirect
	cmp	r15d, 395				; 0000018bH
	je	SHORT $LN25@LoopDirect
$LN31@LoopDirect:

; 73   :     default: /* FOR, FORC, IRP, IRPC */
; 74   :         /* get the formal parameter and the argument list */
; 75   :         /* the format parameter will become a macro parameter, so it can
; 76   :          * be a simple T_ID, but also an instruction or something else.
; 77   :          * v2.02: And it can begin with a '.'!
; 78   :          */
; 79   :         if( tokenarray[i].token == T_FINAL ) {

	movsxd	rax, r14d
	shl	rax, 5
	cmp	BYTE PTR [rax+rdi], r13b
	jne	$LN32@LoopDirect

; 80   :             return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i-1].tokpos ) );

	mov	rdx, QWORD PTR [rax+rdi-8]
	mov	ecx, 209				; 000000d1H
	call	EmitErr
	jmp	$LN1@LoopDirect
$LN108@LoopDirect:

; 51   :     case T_WHILE:
; 52   :         arg_loc = i;

	mov	r14d, DWORD PTR arg_loc$[rbp]
$LN25@LoopDirect:

; 53   :         /* no break */
; 54   :     case T_REPT:
; 55   :     case T_REPEAT:
; 56   :         /* the expression is "critical", that is, no forward
; 57   :          * referenced symbols may be used here!
; 58   :          */
; 59   :         if ( EvalOperand( &i, tokenarray, Token_Count, &opnd, EXPF_NOUNDEF ) == ERROR ) {

	mov	r8d, DWORD PTR ModuleInfo+496
	lea	r9, QWORD PTR opnd$[rbp]
	mov	rdx, rdi
	mov	BYTE PTR [rsp+32], 2
	lea	rcx, QWORD PTR i$[rbp]
	call	EvalOperand
	cmp	eax, -1
	jne	SHORT $LN26@LoopDirect

; 60   :             opnd.value = 0;
; 61   :             i = Token_Count;

	mov	eax, DWORD PTR ModuleInfo+496
	mov	rsi, QWORD PTR parmstring$[rbp]
	mov	DWORD PTR i$[rbp], eax
	mov	DWORD PTR opnd$[rbp], r13d
	jmp	$LN2@LoopDirect
$LN26@LoopDirect:

; 62   :         } else if ( opnd.kind != EXPR_CONST ) { /* syntax <REPEAT|WHILE 'A'> is valid! */

	cmp	DWORD PTR opnd$[rbp+60], r13d
	je	SHORT $LN28@LoopDirect

; 63   :             DebugMsg(( "LoopDirective(%s): invalid argument type %u\n", GetResWName( directive, NULL ), opnd.kind ));
; 64   :             EmitError( CONSTANT_EXPECTED );

	mov	ecx, 65					; 00000041H
	call	EmitError

; 65   :             opnd.value = 0;

	mov	rsi, QWORD PTR parmstring$[rbp]
	mov	DWORD PTR opnd$[rbp], r13d
	jmp	$LN2@LoopDirect
$LN28@LoopDirect:

; 66   :         } else if( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, DWORD PTR i$[rbp]
	shl	rax, 5
	cmp	BYTE PTR [rax+rdi], r13b
	je	SHORT $LN109@LoopDirect

; 67   :             EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos );

	mov	rdx, QWORD PTR [rax+rdi+24]
	mov	ecx, 209				; 000000d1H
	call	EmitErr

; 68   :             /* v2.09: don't exit, the macro lines must be read first. */
; 69   :             //return( ERROR );
; 70   :             opnd.value = 0;

	mov	DWORD PTR opnd$[rbp], r13d
$LN109@LoopDirect:

; 71   :         }
; 72   :         break;

	mov	rsi, QWORD PTR parmstring$[rbp]
	jmp	$LN2@LoopDirect
$LN32@LoopDirect:

; 81   :         }
; 82   :         /* v2.02: allow parameter name to begin with a '.' */
; 83   :         //c = *tokenarray[i].string_ptr;
; 84   :         //if( ( is_valid_id_char(c) == FALSE ) || ( isdigit(c) == TRUE ) ) {
; 85   :         if( is_valid_id_first_char( *tokenarray[i].string_ptr ) == FALSE ) {

	mov	rax, QWORD PTR [rax+rdi+8]
	movsx	ecx, BYTE PTR [rax]
	call	isalpha
	movsxd	rcx, DWORD PTR i$[rbp]
	test	eax, eax
	jne	SHORT $LN33@LoopDirect
	mov	rdx, rcx
	shl	rdx, 5
	add	rdx, rdi
	mov	rax, QWORD PTR [rdx+8]
	movzx	r8d, BYTE PTR [rax]
	lea	eax, DWORD PTR [r8-36]
	cmp	al, 59					; 0000003bH
	ja	SHORT $LN101@LoopDirect
	mov	r9, 576460752706076673			; 0800000018000001H
	bt	r9, rax
	jb	SHORT $LN33@LoopDirect
$LN101@LoopDirect:
	cmp	r8b, 46					; 0000002eH
	jne	SHORT $LN100@LoopDirect
	test	BYTE PTR ModuleInfo+408, 16
	jne	SHORT $LN33@LoopDirect
$LN100@LoopDirect:

; 86   :             DebugMsg(( "LoopDirective(FOR/FORC): token %s is not a valid parameter name\n", tokenarray[i].string_ptr ));
; 87   :             return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos ) );

	mov	rdx, QWORD PTR [rdx+24]
	mov	ecx, 209				; 000000d1H
	call	EmitErr
	jmp	$LN1@LoopDirect
$LN33@LoopDirect:

; 88   :         }
; 89   :         arg_loc = i;

	mov	r14d, ecx
	lea	eax, DWORD PTR [r15-390]

; 90   :         i++;

	inc	ecx
	mov	DWORD PTR i$[rbp], ecx
	test	eax, -3					; fffffffdH
	je	$LN36@LoopDirect

; 123  :             }
; 124  :         } else {
; 125  :             /* for FOR/IRP, skip everything between the name and the comma!
; 126  :              * these items will be stored as (first) macro parameter.
; 127  :              * for example, valid syntax is:
; 128  :              * FOR xxx,<a, ...>
; 129  :              * FOR xxx:REQ,<a, ...>
; 130  :              */
; 131  :             while ( tokenarray[i].token != T_FINAL && tokenarray[i].token != T_COMMA )

	movsxd	rax, ecx
	shl	rax, 5
	movzx	edx, BYTE PTR [rax+rdi]
	test	dl, dl
	je	SHORT $LN9@LoopDirect
	npad	1
$LL8@LoopDirect:
	cmp	dl, 44					; 0000002cH
	je	SHORT $LN9@LoopDirect

; 132  :                 i++;

	inc	ecx
	movsxd	rax, ecx
	shl	rax, 5
	mov	DWORD PTR i$[rbp], ecx
	movzx	edx, BYTE PTR [rax+rdi]
	test	dl, dl
	jne	SHORT $LL8@LoopDirect
$LN9@LoopDirect:

; 133  :             if( tokenarray[i].token != T_COMMA ) {

	movsxd	rdx, ecx
	shl	rdx, 5
	cmp	BYTE PTR [rdx+rdi], 44			; 0000002cH
	jne	SHORT $LN115@LoopDirect

; 134  :                 return( EmitErr( EXPECTING_COMMA, tokenarray[i].tokpos ) );
; 135  :             }
; 136  :             i++;

	inc	ecx

; 137  :             /* FOR/IRP accepts a literal enclosed in <> only */
; 138  :             if( tokenarray[i].token != T_STRING || tokenarray[i].string_delim != '<' ) {

	movsxd	rdx, ecx
	shl	rdx, 5
	add	rdx, rdi
	mov	DWORD PTR i$[rbp], ecx
	cmp	BYTE PTR [rdx], 9
	jne	SHORT $LN100@LoopDirect
	cmp	BYTE PTR [rdx+1], 60			; 0000003cH
	jne	$LN100@LoopDirect

; 139  :                 return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos ) );
; 140  :             }
; 141  :             /* v2.03: also ensure that the literal is the last item */
; 142  :             if( tokenarray[i+1].token != T_FINAL ) {

	cmp	BYTE PTR [rdx+32], r13b
	je	SHORT $LN44@LoopDirect

; 143  :                 return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i+1].tokpos ) );

	mov	rdx, QWORD PTR [rdx+56]
	mov	ecx, 209				; 000000d1H
	call	EmitErr
	jmp	$LN1@LoopDirect
$LN44@LoopDirect:

; 144  :             }
; 145  :             /* v2.08: use myalloca() instead of a fixed-length buffer.
; 146  :              * the loop directives are often nested, they call RunMacro()
; 147  :              * and hence should be careful with stack usage because of JWASMR!
; 148  :              */
; 149  :             //parmstring = myalloca( tokenarray[i].stringlen + 1 );
; 150  :             /* v2.0: use GetLiteralValue() instead of memcpy!!! */
; 151  :             //memcpy( line, tokenarray[i].string_ptr, tokenarray[i].stringlen + 1 );
; 152  :             //GetLiteralValue( parmstring, tokenarray[i].string_ptr );
; 153  :             parmstring = tokenarray[i].string_ptr;

	mov	rsi, QWORD PTR [rdx+8]
	jmp	$LN39@LoopDirect
$LN36@LoopDirect:

; 91   : 
; 92   :         if( directive == T_FORC || directive == T_IRPC ) {
; 93   :             if( tokenarray[i].token != T_COMMA ) {

	movsxd	rdx, ecx
	shl	rdx, 5
	cmp	BYTE PTR [rdx+rdi], 44			; 0000002cH
	je	SHORT $LN37@LoopDirect
$LN115@LoopDirect:

; 94   :                 return( EmitErr( EXPECTING_COMMA, tokenarray[i].tokpos ) );

	mov	rdx, QWORD PTR [rdx+rdi+24]
	mov	ecx, 39					; 00000027H
	call	EmitErr
	jmp	$LN1@LoopDirect
$LN37@LoopDirect:

; 95   :             }
; 96   :             i++;

	inc	ecx
	mov	DWORD PTR i$[rbp], ecx

; 97   :             /* FORC/IRPC accepts anything as "argument list", even nothing! */
; 98   :             if( tokenarray[i].token == T_STRING && tokenarray[i].string_delim == '<' ) {

	movsxd	rcx, ecx
	shl	rcx, 5
	add	rcx, rdi
	cmp	BYTE PTR [rcx], 9
	jne	$LN38@LoopDirect
	cmp	BYTE PTR [rcx+1], 60			; 0000003cH
	jne	$LN38@LoopDirect

; 99   :                 len = tokenarray[i+1].tokpos - (tokenarray[i].tokpos+1);

	mov	ebx, DWORD PTR [rcx+56]
	sub	ebx, DWORD PTR [rcx+24]
	dec	ebx

; 100  :                 parmstring = myalloca( len );

	movsxd	r12, ebx
	lea	rax, QWORD PTR [r12+15]
	cmp	rax, r12
	ja	SHORT $LN107@LoopDirect
	mov	rax, 1152921504606846960		; 0ffffffffffffff0H
$LN107@LoopDirect:
	and	rax, -16
	call	__chkstk

; 101  :                 //GetLiteralValue( parmstring, tokenarray[i].string_ptr );
; 102  :                 memcpy( parmstring, tokenarray[i].tokpos+1, len );

	mov	rdx, QWORD PTR [rcx+24]
	sub	rsp, rax
	inc	rdx
	mov	r8, r12
	lea	rsi, QWORD PTR [rsp+48]
	mov	rcx, rsi
	call	memcpy

; 103  :                 while( *(parmstring+len-1) != '>' ) len--;

	lea	rax, QWORD PTR [rsi-1]
	add	rax, r12
	cmp	BYTE PTR [rax], 62			; 0000003eH
	je	SHORT $LN5@LoopDirect
$LL4@LoopDirect:
	dec	ebx
	lea	rax, QWORD PTR [rax-1]
	cmp	BYTE PTR [rax], 62			; 0000003eH
	jne	SHORT $LL4@LoopDirect
$LN5@LoopDirect:

; 104  :                 *(parmstring+len-1) = NULLC;

	movsxd	rax, ebx
	mov	BYTE PTR [rax+rsi-1], r13b

; 105  :                 /* v2.02: if there's additional stuff behind the <> literal,
; 106  :                  * it's an error!
; 107  :                  */
; 108  :                 if ( tokenarray[i+1].token != T_FINAL )

	movsxd	rcx, DWORD PTR i$[rbp]
	mov	rax, rcx
	shl	rax, 5
	cmp	BYTE PTR [rax+rdi+32], r13b
	je	SHORT $LN39@LoopDirect

; 109  :                     EmitErr( SYNTAX_ERROR_EX, tokenarray[i+1].tokpos );

	mov	rdx, QWORD PTR [rax+rdi+56]
	mov	ecx, 209				; 000000d1H
	call	EmitErr

; 110  :             } else {

	jmp	SHORT $LN113@LoopDirect
$LN38@LoopDirect:

; 111  :                 char *ptr2;
; 112  :                 ptr = tokenarray[i].tokpos;

	mov	r12, QWORD PTR [rcx+24]

; 113  :                 ptr2 = ptr;

	mov	rbx, r12

; 114  :                 /* this is what Masm does: use the string until a space
; 115  :                  * is detected. Anything beyond the space is ignored.
; 116  :                  */
; 117  :                 while ( *ptr2 && ( isspace( *ptr2 ) == FALSE ) )

	cmp	BYTE PTR [r12], r13b
	je	SHORT $LN7@LoopDirect
$LL6@LoopDirect:
	movsx	ecx, BYTE PTR [rbx]
	call	isspace
	test	eax, eax
	jne	SHORT $LN7@LoopDirect

; 118  :                     ptr2++;

	inc	rbx
	cmp	BYTE PTR [rbx], r13b
	jne	SHORT $LL6@LoopDirect
$LN7@LoopDirect:

; 119  :                 len = ptr2 - ptr;

	sub	ebx, r12d

; 120  :                 parmstring = myalloca( len + 1 );

	lea	eax, DWORD PTR [rbx+1]
	movsxd	rcx, eax
	lea	rax, QWORD PTR [rcx+15]
	cmp	rax, rcx
	ja	SHORT $LN106@LoopDirect
	mov	rax, 1152921504606846960		; 0ffffffffffffff0H
$LN106@LoopDirect:
	and	rax, -16
	call	__chkstk
	sub	rsp, rax

; 121  :                 memcpy( parmstring, ptr, len );

	movsxd	rbx, ebx
	mov	r8, rbx
	mov	rdx, r12
	lea	rsi, QWORD PTR [rsp+48]
	mov	rcx, rsi
	call	memcpy

; 122  :                 *(parmstring+len) = NULLC;

	mov	BYTE PTR [rbx+rsi], r13b
$LN113@LoopDirect:
	mov	ecx, DWORD PTR i$[rbp]
$LN39@LoopDirect:

; 154  :             DebugMsg1(("LoopDirective(FOR): param string >%s<\n", parmstring));
; 155  :         }
; 156  :         /* to run StoreMacro(), tokenarray must be setup correctly. */
; 157  :         /* clear contents beginning with the comma! */
; 158  :         i--;

	dec	ecx
	mov	DWORD PTR i$[rbp], ecx

; 159  :         tokenarray[i].token = T_FINAL;

	movsxd	rax, ecx
	shl	rax, 5
	mov	BYTE PTR [rax+rdi], r13b

; 160  :         Token_Count = i;

	mov	eax, DWORD PTR i$[rbp]
	mov	DWORD PTR ModuleInfo+496, eax

; 161  :         i = arg_loc;

	mov	DWORD PTR i$[rbp], r14d
$LN2@LoopDirect:

; 162  :     }
; 163  : 
; 164  :     /* now make a temporary macro */
; 165  :     macro = &tmpmacro;
; 166  :     memset( &tmpmacro, 0, sizeof(tmpmacro) );

	xor	edx, edx
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	lea	r8d, QWORD PTR [rdx+120]
	call	memset

; 167  :     tmpmacro.sym.name = "";

	lea	rax, OFFSET FLAT:$SG10988
	mov	QWORD PTR tmpmacro$[rbp+8], rax

; 168  :     tmpmacro.e.macroinfo = &macinfo;

	lea	rax, QWORD PTR macinfo$[rbp]
	mov	QWORD PTR tmpmacro$[rbp+96], rax

; 169  :     memset( &macinfo, 0, sizeof(macinfo) );

	xor	eax, eax
	mov	QWORD PTR macinfo$[rbp], rax
	mov	QWORD PTR macinfo$[rbp+8], rax
	mov	QWORD PTR macinfo$[rbp+16], rax
	mov	QWORD PTR macinfo$[rbp+24], rax

; 170  :     macinfo.srcfile = get_curr_srcfile();

	call	get_curr_srcfile

; 171  : 
; 172  : #if 0 //DEBUG_OUT
; 173  :     if ( directive ==  T_WHILE )
; 174  :         tmpmacro.sym.name = "<WHILE>";
; 175  :     else if ( directive == T_REPEAT || directive == T_REPT )
; 176  :         tmpmacro.sym.name = "<REPT>";
; 177  :     else if ( directive == T_FORC || directive == T_IRPC )
; 178  :         tmpmacro.sym.name = "<FORC>";
; 179  :     else
; 180  :         tmpmacro.sym.name = "<FOR>";
; 181  : #endif
; 182  : 
; 183  :     DebugMsg1(("LoopDirective(%s): calling StoreMacro\n", GetResWName( directive, NULL )));
; 184  :     if( StoreMacro( macro, i, tokenarray, TRUE ) == ERROR ) {

	mov	edx, DWORD PTR i$[rbp]
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	mov	r9b, 1
	mov	DWORD PTR macinfo$[rbp+24], eax
	mov	r8, rdi
	call	StoreMacro
	cmp	eax, -1
	jne	SHORT $LN45@LoopDirect

; 185  :         ReleaseMacroData( macro );

	lea	rcx, QWORD PTR tmpmacro$[rbp]
	call	ReleaseMacroData

; 186  :         return( ERROR );

	or	rax, -1
	jmp	$LN1@LoopDirect
$LN45@LoopDirect:

; 187  :     }
; 188  :     /* EXITM <> is allowed inside a macro loop.
; 189  :      * This doesn't make the loop a macro function, reset the bit!
; 190  :      */
; 191  :     macro->sym.isfunc = FALSE;

	and	BYTE PTR tmpmacro$[rbp+44], 253		; 000000fdH

; 192  : 
; 193  :     /* now run the just created macro in a loop */
; 194  : 
; 195  :     /* don't run the macro if there are no lines (macroinfo->data == NULL)!
; 196  :      * this isn't exactly what Masm does; an empty 'WHILE 1'
; 197  :      * will loop "forever" in Masm,
; 198  :      */
; 199  :     if ( macinfo.data ) /* added in v2.01 */

	cmp	QWORD PTR macinfo$[rbp+16], r13
	je	$LN78@LoopDirect
	lea	eax, DWORD PTR [r15-390]
	test	eax, -3					; fffffffdH
	je	$LN52@LoopDirect

; 200  :     switch ( directive ) {

	cmp	r15d, 392				; 00000188H
	jle	$LN59@LoopDirect
	cmp	r15d, 394				; 0000018aH
	jle	$LN47@LoopDirect
	cmp	r15d, 395				; 0000018bH
	jne	$LN59@LoopDirect

; 215  :     case T_WHILE:
; 216  :         while ( opnd.kind == EXPR_CONST && opnd.value != 0 ) {

	cmp	DWORD PTR opnd$[rbp+60], r13d
	jne	$LN78@LoopDirect
	npad	9
$LL15@LoopDirect:
	cmp	DWORD PTR opnd$[rbp], r13d
	je	$LN78@LoopDirect

; 217  :             DebugMsg1(("LoopDirective WHILE: cnt=%u\n", count++ ));
; 218  :             RunMacro( macro, Token_Count, tokenarray, NULL, 0, &is_exitm );

	mov	edx, DWORD PTR ModuleInfo+496
	lea	rax, QWORD PTR is_exitm$[rbp]
	mov	QWORD PTR [rsp+40], rax
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	xor	r9d, r9d
	mov	DWORD PTR [rsp+32], r13d
	mov	r8, rdi
	call	RunMacro

; 219  :             if ( is_exitm )

	cmp	BYTE PTR is_exitm$[rbp], r13b
	jne	$LN78@LoopDirect

; 220  :                 break;
; 221  :             i = arg_loc;
; 222  :             if ( EvalOperand( &i, tokenarray, Token_Count, &opnd, 0 ) == ERROR )

	mov	r8d, DWORD PTR ModuleInfo+496
	lea	r9, QWORD PTR opnd$[rbp]
	mov	rdx, rdi
	mov	DWORD PTR i$[rbp], r14d
	lea	rcx, QWORD PTR i$[rbp]
	mov	BYTE PTR [rsp+32], r13b
	call	EvalOperand
	cmp	eax, -1
	je	$LN78@LoopDirect

; 223  :                 break;
; 224  :             macro->sym.value++;

	inc	DWORD PTR tmpmacro$[rbp+16]
	cmp	DWORD PTR opnd$[rbp+60], r13d
	je	SHORT $LL15@LoopDirect

; 225  :         }
; 226  :         break;

	jmp	$LN78@LoopDirect
$LN47@LoopDirect:

; 201  :     case T_REPEAT:
; 202  :     case T_REPT:
; 203  :         /* negative repeat counts are accepted and are treated like 0 */
; 204  :         for ( ; macro->sym.value < opnd.value; macro->sym.value++ ) {

	mov	eax, DWORD PTR opnd$[rbp]
	cmp	DWORD PTR tmpmacro$[rbp+16], eax
	jge	$LN78@LoopDirect
	npad	14
$LL14@LoopDirect:

; 205  :             /* v2.10: Token_Count becomes volatile if MF_NOSAVE is set */
; 206  :             tokenarray[0].token = T_FINAL;
; 207  :             Token_Count = 0;
; 208  :             //RunMacro( macro, Token_Count, tokenarray, NULL, MF_NOSAVE, &is_exitm );
; 209  :             RunMacro( macro, 0, tokenarray, NULL, MF_NOSAVE, &is_exitm );

	lea	rax, QWORD PTR is_exitm$[rbp]
	mov	BYTE PTR [rdi], r13b
	mov	QWORD PTR [rsp+40], rax
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	xor	r9d, r9d
	mov	DWORD PTR [rsp+32], 2
	mov	r8, rdi
	mov	DWORD PTR ModuleInfo+496, r13d
	xor	edx, edx
	call	RunMacro

; 210  :             if ( is_exitm )

	cmp	BYTE PTR is_exitm$[rbp], r13b
	jne	$LN78@LoopDirect

; 201  :     case T_REPEAT:
; 202  :     case T_REPT:
; 203  :         /* negative repeat counts are accepted and are treated like 0 */
; 204  :         for ( ; macro->sym.value < opnd.value; macro->sym.value++ ) {

	mov	eax, DWORD PTR tmpmacro$[rbp+16]
	inc	eax
	mov	DWORD PTR tmpmacro$[rbp+16], eax
	cmp	eax, DWORD PTR opnd$[rbp]
	jl	SHORT $LL14@LoopDirect

; 211  :                 break;
; 212  :             DebugMsg1(("LoopDirective REPT: iteration=%" I32_SPEC "u\n", ++count ));
; 213  :         }
; 214  :         break;

	jmp	$LN78@LoopDirect
$LN59@LoopDirect:

; 257  :                 break;
; 258  :             DebugMsg1(("LoopDirective FORC: call RunMacro(), cnt=%" I32_SPEC "u, param=>%s<\n", count++, buffer ));
; 259  :         }
; 260  :         break;
; 261  :     default: /* T_FOR, T_IRP */
; 262  :         i = Token_Count + 1;

	mov	edx, DWORD PTR ModuleInfo+496

; 263  :         Token_Count = Tokenize( parmstring, i, tokenarray, TOK_RESCAN | TOK_NOCURLBRACES );

	mov	r9d, 3
	inc	edx
	mov	r8, rdi
	mov	rcx, rsi
	mov	DWORD PTR i$[rbp], edx
	call	Tokenize
	movsxd	rdx, eax

; 264  :         DebugMsg1(("LoopDirective FOR: full param=>%s<\n", tokenarray[i].tokpos ));
; 265  : 
; 266  :         /* v2.09: if a trailing comma is followed by white space(s), add a blank token */
; 267  :         if ( i != Token_Count && tokenarray[Token_Count-1].token == T_COMMA &&

	mov	eax, DWORD PTR i$[rbp]
	mov	DWORD PTR ModuleInfo+496, edx
	cmp	eax, edx
	je	$LN60@LoopDirect
	mov	r8, rdx
	shl	r8, 5
	cmp	BYTE PTR [r8+rdi-32], 44		; 0000002cH
	jne	$LN60@LoopDirect
	mov	rcx, QWORD PTR [r8+rdi-8]
	cmp	BYTE PTR [rcx+1], r13b
	je	SHORT $LN60@LoopDirect

; 268  :             *(tokenarray[Token_Count-1].tokpos+1) ) {
; 269  :             tokenarray[Token_Count].token = T_STRING;

	mov	BYTE PTR [r8+rdi], 9

; 270  :             tokenarray[Token_Count].string_delim = NULLC;

	movsxd	rax, DWORD PTR ModuleInfo+496
	shl	rax, 5
	mov	BYTE PTR [rax+rdi+1], r13b

; 271  :             tokenarray[Token_Count].stringlen = strlen( tokenarray[Token_Count].tokpos );

	movsxd	rdx, DWORD PTR ModuleInfo+496
	shl	rdx, 5
	or	rax, -1
	mov	rcx, QWORD PTR [rdx+rdi+24]
	npad	2
$LL105@LoopDirect:
	inc	rax
	cmp	BYTE PTR [rcx+rax], r13b
	jne	SHORT $LL105@LoopDirect
	mov	DWORD PTR [rdx+rdi+16], eax

; 272  :             tokenarray[Token_Count+1].tokpos = tokenarray[Token_Count].tokpos + tokenarray[Token_Count].stringlen;

	movsxd	rcx, DWORD PTR ModuleInfo+496
	shl	rcx, 5
	mov	eax, DWORD PTR [rcx+rdi+16]
	add	rax, QWORD PTR [rcx+rdi+24]
	mov	QWORD PTR [rcx+rdi+56], rax

; 273  :             Token_Count++;

	mov	eax, DWORD PTR ModuleInfo+496
	inc	eax
	mov	DWORD PTR ModuleInfo+496, eax

; 274  :             tokenarray[Token_Count].token = T_FINAL;

	cdqe
	shl	rax, 5
	mov	BYTE PTR [rax+rdi], r13b
	mov	eax, DWORD PTR i$[rbp]
	mov	edx, DWORD PTR ModuleInfo+496
$LN60@LoopDirect:

; 275  :         }
; 276  : 
; 277  :         /* a FOR/IRP parameter can be a macro function call */
; 278  :         /* that's why the macro calls must be run synchronously */
; 279  :         /* v2.05: reset an optional VARARG attribute for the macro
; 280  :          * parameter.
; 281  :          * take care of a trailing comma, this is to make another
; 282  :          * RunMacro() call with a "blank" argument.
; 283  :          */
; 284  :         macro->sym.mac_vararg = FALSE;

	and	BYTE PTR tmpmacro$[rbp+44], 254		; 000000feH

; 285  :         /* v2.09: flag MF_IGNARGS introduced. This allows RunMacro() to
; 286  :          * parse the full argument and trigger macro expansion if necessary.
; 287  :          * No need anymore to count commas here. */
; 288  :         for( ; i < Token_Count; i++, macro->sym.value++ ) {

	cmp	eax, edx
	jge	$LN78@LoopDirect
	npad	10
$LL22@LoopDirect:

; 289  :             DebugMsg1(("LoopDirective FOR: cnt=%" I32_SPEC "u, calling RunMacro( param=>%s< )\n", count++, tokenarray[i].tokpos ));
; 290  :             i = RunMacro( macro, i, tokenarray, NULL, MF_IGNARGS, &is_exitm );

	lea	rcx, QWORD PTR is_exitm$[rbp]
	xor	r9d, r9d
	mov	QWORD PTR [rsp+40], rcx
	mov	r8, rdi
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	mov	DWORD PTR [rsp+32], 4
	mov	edx, eax
	call	RunMacro
	mov	DWORD PTR i$[rbp], eax

; 291  :             if ( i < 0 || is_exitm )

	test	eax, eax
	js	$LN78@LoopDirect
	cmp	BYTE PTR is_exitm$[rbp], r13b
	jne	$LN78@LoopDirect

; 285  :         /* v2.09: flag MF_IGNARGS introduced. This allows RunMacro() to
; 286  :          * parse the full argument and trigger macro expansion if necessary.
; 287  :          * No need anymore to count commas here. */
; 288  :         for( ; i < Token_Count; i++, macro->sym.value++ ) {

	inc	DWORD PTR tmpmacro$[rbp+16]
	inc	eax
	cmp	eax, DWORD PTR ModuleInfo+496
	mov	DWORD PTR i$[rbp], eax
	jl	SHORT $LL22@LoopDirect

; 256  :             if ( is_exitm )

	jmp	$LN78@LoopDirect
$LN52@LoopDirect:

; 227  :     case T_FORC:
; 228  :     case T_IRPC:
; 229  :         for( ptr = parmstring; *ptr; ptr++, macro->sym.value++ ) {

	cmp	BYTE PTR [rsi], r13b
	je	$LN78@LoopDirect
	npad	15
$LL19@LoopDirect:

; 230  :             tokenarray[0].token = T_STRING;
; 231  :             tokenarray[0].string_delim = NULLC;
; 232  :             tokenarray[0].string_ptr = buffer;

	lea	rax, QWORD PTR buffer$[rbp]
	mov	WORD PTR [rdi], 9
	mov	QWORD PTR [rdi+8], rax

; 233  :             tokenarray[0].tokpos = buffer;

	lea	rax, QWORD PTR buffer$[rbp]
	mov	QWORD PTR [rdi+24], rax

; 234  :             tokenarray[1].token = T_FINAL;

	mov	BYTE PTR [rdi+32], r13b

; 235  :             buffer[2] = NULLC;
; 236  :             Token_Count = 1;

	mov	DWORD PTR ModuleInfo+496, 1
	mov	BYTE PTR buffer$[rbp+2], r13b

; 237  :             if ( *ptr == '!' ) {

	movzx	eax, BYTE PTR [rsi]
	cmp	al, 33					; 00000021H
	jne	SHORT $LN53@LoopDirect

; 238  :                 buffer[0] = *ptr++;

	inc	rsi
	mov	BYTE PTR buffer$[rbp], al

; 239  :                 buffer[1] = *ptr;

	movzx	eax, BYTE PTR [rsi]
	mov	BYTE PTR buffer$[rbp+1], al

; 240  :                 if ( *ptr == NULLC ) /* ensure the macro won't go beyond the 00 */

	cmp	BYTE PTR [rsi], r13b
	jne	SHORT $LN55@LoopDirect

; 241  :                     ptr--;

	dec	rsi
$LN55@LoopDirect:

; 242  :                 tokenarray[0].stringlen = 2;

	mov	DWORD PTR [rdi+16], 2

; 243  :                 tokenarray[1].tokpos = buffer+2;

	lea	rax, QWORD PTR buffer$[rbp+2]
	jmp	SHORT $LN114@LoopDirect
$LN53@LoopDirect:

; 244  :             } else if ( isspace( *ptr ) ) {

	movsx	ecx, al
	call	isspace
	test	eax, eax
	je	SHORT $LN56@LoopDirect

; 245  :                 buffer[0] = '!';

	mov	BYTE PTR buffer$[rbp], 33		; 00000021H

; 246  :                 buffer[1] = *ptr;

	movzx	eax, BYTE PTR [rsi]
	mov	BYTE PTR buffer$[rbp+1], al

; 247  :                 tokenarray[0].stringlen = 2;
; 248  :                 tokenarray[1].tokpos = buffer+2;

	lea	rax, QWORD PTR buffer$[rbp+2]
	mov	DWORD PTR [rdi+16], 2

; 249  :             } else {

	jmp	SHORT $LN114@LoopDirect
$LN56@LoopDirect:

; 250  :                 buffer[0] = *ptr;

	movzx	eax, BYTE PTR [rsi]
	mov	BYTE PTR buffer$[rbp], al

; 251  :                 tokenarray[0].stringlen = 1;
; 252  :                 tokenarray[1].tokpos = buffer+1;

	lea	rax, QWORD PTR buffer$[rbp+1]
	mov	DWORD PTR [rdi+16], 1

; 253  :                 buffer[1] = NULLC;

	mov	BYTE PTR buffer$[rbp+1], r13b
$LN114@LoopDirect:

; 254  :             }
; 255  :             RunMacro( macro, 0, tokenarray, NULL, MF_NOSAVE, &is_exitm );

	mov	QWORD PTR [rdi+56], rax
	lea	rcx, QWORD PTR tmpmacro$[rbp]
	lea	rax, QWORD PTR is_exitm$[rbp]
	xor	r9d, r9d
	mov	QWORD PTR [rsp+40], rax
	mov	r8, rdi
	xor	edx, edx
	mov	DWORD PTR [rsp+32], 2
	call	RunMacro

; 256  :             if ( is_exitm )

	cmp	BYTE PTR is_exitm$[rbp], r13b
	jne	SHORT $LN78@LoopDirect

; 227  :     case T_FORC:
; 228  :     case T_IRPC:
; 229  :         for( ptr = parmstring; *ptr; ptr++, macro->sym.value++ ) {

	inc	DWORD PTR tmpmacro$[rbp+16]
	inc	rsi
	cmp	BYTE PTR [rsi], r13b
	jne	$LL19@LoopDirect
$LN78@LoopDirect:

; 292  :                 break;
; 293  :         }
; 294  :     }
; 295  :     ReleaseMacroData( macro );

	lea	rcx, QWORD PTR tmpmacro$[rbp]
	call	ReleaseMacroData

; 296  :     DebugMsg1(("LoopDirective(%s) exit\n", GetResWName( directive, NULL ) ));
; 297  :     return( NOT_ERROR );

	xor	eax, eax
$LN1@LoopDirect:

; 298  : }

	mov	rbx, QWORD PTR [rbp+360]
	lea	rsp, QWORD PTR [rbp+272]
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rdi
	pop	rsi
	pop	rbp
	ret	0
LoopDirective ENDP
_TEXT	ENDS
END

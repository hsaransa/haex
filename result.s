; begin translation main.haex
; begin translation utils.haex
; begin translation lexer.haex
; begin translation translate.haex
; begin translation x86-64.haex
; begin translation init.haex
section .text
global _start
_start:
    pop rax
    jmp _main

_main:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+40]
    push rax
    mov rax, [rbp+32]
    push rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _init
    pop rbx
    pop rbx
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    call _Program_new
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+-8]
    push rax
    call _translateFile
    pop rbx
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _compile_to_x86_64
    pop rbx
    call _exit_success
    leave
    ret

_init:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    lea rax, [heap_memory]
    push rax
    mov rax, 16
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+16]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L1
    mov rax, str3
    leave
    ret
    jmp .L2
.L1:
.L2:
    mov rax, [rbp+16]
    push rax
    call _parse_c_string
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_compile_to_x86_64:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    mov [rbp+-8], rax
    push 48
    call _allocate
    pop rbx
    mov [rbp+-48], rax
    mov rax, [rbp+-48]
    add rax, 0
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-48]
    add rax, 16
    push rax
    mov rax, 1
    neg rax
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-48]
    add rax, 24
    push rax
    mov rax, 1
    neg rax
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-48]
    add rax, 32
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, str4
    push rax
    call _print_line
    pop rbx
    mov rax, str5
    push rax
    call _print_line
    pop rbx
    mov rax, str6
    push rax
    call _print_line
    pop rbx
    mov rax, str7
    push rax
    call _emit_s
    pop rbx
    mov rax, str8
    push rax
    call _emit_s
    pop rbx
.L9:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L10
    mov rax, [rbp+-8]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 3
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L11
    call _print_eol
    mov rax, str13
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-8]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_string
    pop rbx
    mov rax, str14
    push rax
    call _print_string
    pop rbx
    call _print_eol
    mov rax, str15
    push rax
    call _emit_s
    pop rbx
    mov rax, str16
    push rax
    call _emit_s
    pop rbx
    mov rax, str17
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    mov [rbp+-32], rax
    mov rax, 0
    mov [rbp+-72], rax
    mov rax, [rbp+-8]
    add rax, 48
    mov rax, [rax]
    mov [rbp+-40], rax
.L18:
    mov rax, [rbp+-40]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L19
    mov rax, [rbp+-72]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-72], rax
    mov rax, [rbp+-40]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-40], rax
    jmp .L18
.L19:
    mov rax, [rbp+-8]
    add rax, 48
    mov rax, [rax]
    mov [rbp+-40], rax
    mov rax, 2
    mov [rbp+-64], rax
.L20:
    mov rax, [rbp+-40]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L21
    mov rax, [rbp+-40]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, 4
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 40
    push rax
    mov rax, [rbp+-40]
    add rax, 40
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+-64]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-64]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-64], rax
    mov rax, [rbp+-24]
    add rax, 24
    push rax
    mov rax, [rbp+-32]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    mov [rbp+-32], rax
    mov rax, [rbp+-40]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-40], rax
    jmp .L20
.L21:
    mov rax, [rbp+-8]
    add rax, 64
    mov rax, [rax]
    push rax
    mov rax, [rbp+-32]
    push rax
    call _collect_locals
    pop rbx
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+-48]
    add rax, 8
    push rax
    mov rax, [rbp+-32]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 64
    mov rax, [rax]
    mov [rbp+-56], rax
.L22:
    mov rax, [rbp+-56]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L23
    mov rax, [rbp+-56]
    push rax
    mov rax, [rbp+-48]
    push rax
    call _emit_statement
    pop rbx
    pop rbx
    mov rax, [rbp+-56]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-56], rax
    jmp .L22
.L23:
    mov rax, str24
    push rax
    call _emit_s
    pop rbx
    mov rax, str25
    push rax
    call _emit_s
    pop rbx
    jmp .L12
.L11:
.L12:
    mov rax, [rbp+-8]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-8], rax
    jmp .L9
.L10:
    mov rax, str26
    push rax
    call _print_line
    pop rbx
    mov rax, [rbp+-48]
    add rax, 32
    mov rax, [rax]
    mov [rbp+-80], rax
.L27:
    mov rax, [rbp+-80]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L28
    mov rax, str29
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-80]
    add rax, 0
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    mov rax, str30
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-80]
    add rax, 8
    mov rax, [rax]
    push rax
    call _length
    pop rbx
    push rax
    call _print_int
    pop rbx
    mov rax, str31
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-80]
    add rax, 0
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    call _print_eol
    mov rax, [rbp+-80]
    add rax, 16
    mov rax, [rax]
    mov [rbp+-80], rax
    jmp .L27
.L28:
    mov rax, [rbp+-48]
    add rax, 32
    mov rax, [rax]
    mov [rbp+-80], rax
.L32:
    mov rax, [rbp+-80]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L33
    mov rax, str34
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-80]
    add rax, 0
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    mov rax, str35
    push rax
    call _print_string
    pop rbx
    mov rax, 34
    push rax
    call _print_char
    pop rbx
    mov rax, [rbp+-80]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_string
    pop rbx
    mov rax, 34
    push rax
    call _print_char
    pop rbx
    call _print_eol
    mov rax, [rbp+-80]
    add rax, 16
    mov rax, [rax]
    mov [rbp+-80], rax
    jmp .L32
.L33:
    mov rax, str36
    push rax
    call _print_line
    pop rbx
    mov rax, str37
    push rax
    call _print_line
    pop rbx
    leave
    ret

_emit_statement:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    call _Node_isList
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L38
    mov rax, str40
    push rax
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, str41
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L39
.L38:
.L39:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_isList
    pop rbx
    cmp rax, 0
    je .L42
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    mov [rbp+24], rax
.L44:
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L45
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_statement
    pop rbx
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+24], rax
    jmp .L44
.L45:
    mov rax, 0
    leave
    ret
    jmp .L43
.L42:
.L43:
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L46
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_function_call
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L47
.L46:
.L47:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str50
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L48
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str51
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str52
    push rax
    call _emit_s
    pop rbx
    mov rax, str53
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L49
.L48:
.L49:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str56
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L54
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str57
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str58
    push rax
    call _emit_s
    pop rbx
    mov rax, str59
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L55
.L54:
.L55:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str62
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L60
    call _nop
    jmp .L61
.L60:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str65
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L63
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L66
    mov rax, str68
    push rax
    call _print_line
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _print_line
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _print_node_pos
    pop rbx
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_symbols
    pop rbx
    int 3 ; cannot stat exit_failure
    jmp .L67
.L66:
.L67:
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str69
    push rax
    mov rax, [rbp+-8]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, 8
    pop rbx
    mul rbx
    push rax
    mov rax, str70
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    jmp .L64
.L63:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str73
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L71
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    add rax, 40
    mov rax, [rax]
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+-8]
    add rax, 32
    mov rax, [rax]
    mov [rbp+-8], rax
.L74:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L75
    mov rax, [rbp+-8]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L76
    mov rax, str78
    push rax
    mov rax, [rbp+-8]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, 8
    pop rbx
    mul rbx
    push rax
    mov rax, str79
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, str80
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str81
    push rax
    call _emit_s
    pop rbx
    mov rax, str82
    push rax
    call _emit_s
    pop rbx
    jmp .L75
    jmp .L77
.L76:
.L77:
    mov rax, [rbp+-8]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-8], rax
    jmp .L74
.L75:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L83
    mov rax, str85
    push rax
    call _print_line
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _print_line
    pop rbx
    jmp .L84
.L83:
.L84:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L72
.L71:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str88
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L86
    mov rax, [rbp+16]
    push rax
    call _new_label
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+16]
    push rax
    call _new_label
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str89
    push rax
    call _emit_s
    pop rbx
    mov rax, str90
    push rax
    mov rax, [rbp+-24]
    push rax
    mov rax, str91
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_statement
    pop rbx
    pop rbx
    mov rax, str92
    push rax
    mov rax, [rbp+-32]
    push rax
    mov rax, str93
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, [rbp+-24]
    push rax
    call _emit_l
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L94
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_statement
    pop rbx
    pop rbx
    jmp .L95
.L94:
.L95:
    mov rax, [rbp+-32]
    push rax
    call _emit_l
    pop rbx
    jmp .L87
.L86:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str98
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L96
    mov rax, [rbp+16]
    push rax
    call _new_label
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+16]
    push rax
    call _new_label
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+16]
    add rax, 16
    mov rax, [rax]
    mov [rbp+-48], rax
    mov rax, [rbp+16]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-56], rax
    mov rax, [rbp+16]
    add rax, 16
    push rax
    mov rax, [rbp+-24]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+16]
    add rax, 24
    push rax
    mov rax, [rbp+-32]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    push rax
    call _emit_l
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str99
    push rax
    call _emit_s
    pop rbx
    mov rax, str100
    push rax
    mov rax, [rbp+-32]
    push rax
    mov rax, str101
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_statement
    pop rbx
    pop rbx
    mov rax, str102
    push rax
    mov rax, [rbp+-24]
    push rax
    mov rax, str103
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, [rbp+-32]
    push rax
    call _emit_l
    pop rbx
    mov rax, [rbp+16]
    add rax, 16
    push rax
    mov rax, [rbp+-48]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+16]
    add rax, 24
    push rax
    mov rax, [rbp+-56]
    pop rbx
    mov [rbx], rax
    jmp .L97
.L96:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str106
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L104
    mov rax, str107
    push rax
    mov rax, [rbp+16]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, str108
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    jmp .L105
.L104:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str111
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L109
    mov rax, str112
    push rax
    mov rax, [rbp+16]
    add rax, 24
    mov rax, [rax]
    push rax
    mov rax, str113
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    jmp .L110
.L109:
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str116
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L114
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str117
    push rax
    call _emit_s
    pop rbx
    mov rax, str118
    push rax
    call _emit_s
    pop rbx
    jmp .L115
.L114:
    mov rax, str119
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _emit_ss
    pop rbx
    pop rbx
.L115:
.L110:
.L105:
.L97:
.L87:
.L72:
.L64:
.L61:
    leave
    ret

_emit_function_call:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L120
    mov rax, str122
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _emit_ss
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L121
.L120:
.L121:
    mov rax, [rbp+-8]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 3
    push rax
    call _eq
    pop rbx
    pop rbx
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-16], rax
.L123:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L124
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str125
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-16], rax
    jmp .L123
.L124:
    mov rax, str126
    push rax
    mov rax, [rbp+-8]
    add rax, 8
    mov rax, [rax]
    push rax
    call _emit_ss
    pop rbx
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-16], rax
.L127:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L128
    mov rax, str129
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-16], rax
    jmp .L127
.L128:
    mov rax, 0
    leave
    ret
    leave
    ret

_emit_expr:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 40
    push rax
    mov rax, str130
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L131
    mov rax, [rbp+24]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str135
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L133
    mov rax, str136
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L134
.L133:
.L134:
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L137
    mov rax, str139
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_id
    pop rbx
    push rax
    call _print_line_ss
    pop rbx
    pop rbx
    jmp .L138
.L137:
.L138:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+-16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L140
    mov rax, str142
    push rax
    mov rax, [rbp+-16]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, str143
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L141
.L140:
.L141:
    mov rax, [rbp+16]
    add rax, 40
    push rax
    mov rax, [rbp+-16]
    add rax, 40
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, str144
    push rax
    mov rax, 8
    push rax
    mov rax, [rbp+-16]
    add rax, 16
    mov rax, [rax]
    pop rbx
    mul rbx
    push rax
    mov rax, str145
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L132
.L131:
.L132:
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L146
    mov rax, str148
    push rax
    mov rax, [rbp+24]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, str149
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L147
.L146:
.L147:
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 2
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L150
    mov rax, [rbp+16]
    push rax
    call _new_label
    pop rbx
    mov [rbp+-8], rax
    push 24
    call _allocate
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 0
    push rax
    mov rax, [rbp+-8]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 8
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_str
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+16]
    add rax, 32
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+16]
    add rax, 32
    push rax
    mov rax, [rbp+-24]
    pop rbx
    mov [rbx], rax
    mov rax, str152
    push rax
    mov rax, [rbp+-8]
    push rax
    mov rax, str153
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L151
.L150:
.L151:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str156
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L154
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    add rax, 40
    mov rax, [rax]
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+-16]
    add rax, 32
    mov rax, [rax]
    mov [rbp+-16], rax
.L157:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L158
    mov rax, [rbp+-16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L159
    mov rax, str161
    push rax
    mov rax, [rbp+-16]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, 8
    pop rbx
    mul rbx
    push rax
    mov rax, str162
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, str163
    push rax
    call _emit_s
    pop rbx
    jmp .L158
    jmp .L160
.L159:
.L160:
    mov rax, [rbp+-16]
    add rax, 24
    mov rax, [rax]
    mov [rbp+-16], rax
    jmp .L157
.L158:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L164
    mov rax, str166
    push rax
    call _print_line
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _print_line
    pop rbx
    jmp .L165
.L164:
.L165:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L155
.L154:
.L155:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str169
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L167
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, str170
    push rax
    mov rax, 8
    push rax
    mov rax, [rbp+-16]
    add rax, 16
    mov rax, [rax]
    pop rbx
    mul rbx
    push rax
    mov rax, str171
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L168
.L167:
.L168:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str174
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L172
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str175
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L173
.L172:
.L173:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str178
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L176
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str179
    push rax
    call _emit_s
    pop rbx
    mov rax, str180
    push rax
    call _emit_s
    pop rbx
    mov rax, str181
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L177
.L176:
.L177:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str184
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L182
    mov rax, str185
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L183
.L182:
.L183:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str188
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L186
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    call _find_symbol
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    push rax
    call _assert
    pop rbx
    mov rax, str189
    push rax
    mov rax, [rbp+-16]
    add rax, 16
    mov rax, [rax]
    push rax
    mov rax, 8
    pop rbx
    mul rbx
    push rax
    mov rax, str190
    push rax
    call _emit_sis
    pop rbx
    pop rbx
    pop rbx
    mov rax, str191
    push rax
    call _emit_s
    pop rbx
    mov rax, str192
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L187
.L186:
.L187:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str195
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L193
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str196
    push rax
    call _emit_s
    pop rbx
    mov rax, str197
    push rax
    call _emit_s
    pop rbx
    mov rax, str198
    push rax
    call _emit_s
    pop rbx
    mov rax, str199
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L194
.L193:
.L194:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str202
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L200
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str203
    push rax
    call _emit_s
    pop rbx
    mov rax, str204
    push rax
    call _emit_s
    pop rbx
    mov rax, str205
    push rax
    call _emit_s
    pop rbx
    mov rax, str206
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L201
.L200:
.L201:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str209
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L207
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str210
    push rax
    call _emit_s
    pop rbx
    mov rax, str211
    push rax
    call _emit_s
    pop rbx
    mov rax, str212
    push rax
    call _emit_s
    pop rbx
    mov rax, str213
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L208
.L207:
.L208:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str216
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L214
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str217
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str218
    push rax
    call _emit_s
    pop rbx
    mov rax, str219
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L215
.L214:
.L215:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str222
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L220
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str223
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str224
    push rax
    call _emit_s
    pop rbx
    mov rax, str225
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L221
.L220:
.L221:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str228
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L226
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str229
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str230
    push rax
    call _emit_s
    pop rbx
    mov rax, str231
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L227
.L226:
.L227:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str234
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L232
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str235
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str236
    push rax
    call _emit_s
    pop rbx
    mov rax, str237
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L233
.L232:
.L233:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str240
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L238
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str241
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str242
    push rax
    call _emit_s
    pop rbx
    mov rax, str243
    push rax
    call _emit_s
    pop rbx
    mov rax, str244
    push rax
    call _emit_s
    pop rbx
    mov rax, str245
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L239
.L238:
.L239:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str248
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L246
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str249
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L247
.L246:
.L247:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str252
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L250
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str253
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str254
    push rax
    call _emit_s
    pop rbx
    mov rax, str255
    push rax
    call _emit_s
    pop rbx
    mov rax, str256
    push rax
    call _emit_s
    pop rbx
    mov rax, str257
    push rax
    call _emit_s
    pop rbx
    mov rax, str258
    push rax
    call _emit_s
    pop rbx
    mov rax, str259
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L251
.L250:
.L251:
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str262
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L260
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str263
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str264
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str265
    push rax
    call _emit_s
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_expr
    pop rbx
    pop rbx
    mov rax, str266
    push rax
    call _emit_s
    pop rbx
    mov rax, str267
    push rax
    call _emit_s
    pop rbx
    mov rax, str268
    push rax
    call _emit_s
    pop rbx
    mov rax, str269
    push rax
    call _emit_s
    pop rbx
    mov rax, str270
    push rax
    call _emit_s
    pop rbx
    mov rax, str271
    push rax
    call _emit_s
    pop rbx
    mov rax, 0
    leave
    ret
    jmp .L261
.L260:
.L261:
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _emit_function_call
    pop rbx
    pop rbx
    leave
    ret

_emit_sis:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str272
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+32]
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _print_int
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_emit_ss:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str273
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_emit_l:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str274
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_int
    pop rbx
    mov rax, str275
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_emit_s:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str276
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_new_label:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    push rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    leave
    ret
    leave
    ret

_collect_locals:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 1
    mov [rbp+-24], rax
.L277:
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L278
    mov rax, [rbp+24]
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str281
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L279
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 2
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 40
    push rax
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 16
    push rax
    mov rax, [rbp+-24]
    neg rax
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-8]
    add rax, 24
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    mov [rbp+16], rax
    jmp .L280
.L279:
.L280:
    mov rax, [rbp+24]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+24], rax
    jmp .L277
.L278:
    mov rax, [rbp+16]
    leave
    ret
    leave
    ret

_printSymbolTable:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 4
    push rax
    call _printSymbols
    pop rbx
    pop rbx
    leave
    ret

_printSymbols:
    push rbp
    mov rbp, rsp
    sub rsp, 256
.L282:
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L283
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _printSymbol
    pop rbx
    pop rbx
    mov rax, [rbp+24]
    add rax, 24
    mov rax, [rax]
    mov [rbp+24], rax
    jmp .L282
.L283:
    leave
    ret

_printSymbol:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _print_indent
    pop rbx
    mov rax, [rbp+24]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_string
    pop rbx
    mov rax, str284
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    call _print_eol
    mov rax, [rbp+24]
    add rax, 32
    mov rax, [rax]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L285
    mov rax, [rbp+16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    push rax
    call _print_indent
    pop rbx
    mov rax, str287
    push rax
    call _print_string
    pop rbx
    call _print_eol
    mov rax, [rbp+24]
    add rax, 32
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 2
    pop rbx
    add rax, rbx
    push rax
    call _printSymbols
    pop rbx
    pop rbx
    jmp .L286
.L285:
.L286:
    mov rax, [rbp+24]
    add rax, 48
    mov rax, [rax]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L288
    mov rax, [rbp+16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    push rax
    call _print_indent
    pop rbx
    mov rax, str290
    push rax
    call _print_string
    pop rbx
    call _print_eol
    mov rax, [rbp+24]
    add rax, 48
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 2
    pop rbx
    add rax, rbx
    push rax
    call _printSymbols
    pop rbx
    pop rbx
    jmp .L289
.L288:
.L289:
    leave
    ret

_translateFile:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str291
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    mov rax, [rbp+16]
    push rax
    call _read_file
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    push rax
    call _lex
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-16]
    push rax
    call _translate
    pop rbx
    pop rbx
    leave
    ret

_translate:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-8], rax
.L292:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L293
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-8]
    push rax
    call _translateTop
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    jmp .L292
.L293:
    leave
    ret

_translateTop:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str296
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L294
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-8]
    add rax, 40
    mov rax, [rax]
    add rax, 16
    mov rax, [rax]
    push rax
    call _translateFile
    pop rbx
    pop rbx
    jmp .L295
.L294:
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str299
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L297
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str302
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L300
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-8], rax
.L303:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L304
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-8]
    push rax
    call _translateTop
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    jmp .L303
.L304:
    jmp .L301
.L300:
.L301:
    jmp .L298
.L297:
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str307
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L305
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    mov rax, 0
    mov [rbp+-40], rax
.L308:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L309
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 0
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Program_addSymbol
    pop rbx
    pop rbx
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+-40]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-40]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-40], rax
    mov rax, [rbp+-8]
    add rax, 40
    mov rax, [rax]
    mov [rbp+-8], rax
    jmp .L308
.L309:
    jmp .L306
.L305:
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str312
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L310
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 5
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Program_addSymbol
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-8], rax
    mov rax, 0
    mov [rbp+-40], rax
.L313:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L314
    mov rax, [rbp+-8]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 6
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+-32]
    add rax, 40
    push rax
    mov rax, [rbp+-8]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-32]
    add rax, 16
    push rax
    mov rax, [rbp+-40]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-32]
    add rax, 24
    push rax
    mov rax, [rbp+-24]
    add rax, 32
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 32
    push rax
    mov rax, [rbp+-32]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-40]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-40], rax
    jmp .L313
.L314:
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+-40]
    pop rbx
    mov [rbx], rax
    jmp .L311
.L310:
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, str317
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L315
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 3
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Program_addSymbol
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_children
    pop rbx
    mov [rbp+-16], rax
.L318:
    mov rax, [rbp+-16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L319
    mov rax, [rbp+-16]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_id
    pop rbx
    push rax
    mov rax, 4
    push rax
    call _Symbol_new
    pop rbx
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+-32]
    add rax, 40
    push rax
    mov rax, [rbp+-16]
    push rax
    call _Node_children
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-32]
    add rax, 24
    push rax
    mov rax, [rbp+-24]
    add rax, 48
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 48
    push rax
    mov rax, [rbp+-32]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-16]
    push rax
    call _Node_next
    pop rbx
    mov [rbp+-16], rax
    jmp .L318
.L319:
    mov rax, [rbp+-24]
    add rax, 56
    push rax
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_id
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-24]
    add rax, 64
    push rax
    mov rax, [rbp+-8]
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_next
    pop rbx
    push rax
    call _Node_children
    pop rbx
    pop rbx
    mov [rbx], rax
    jmp .L316
.L315:
    mov rax, str320
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _Node_id
    pop rbx
    push rax
    call _print_string
    pop rbx
    call _print_eol
    int 3 ; cannot stat exit_failure
.L316:
.L311:
.L306:
.L298:
.L295:
    leave
    ret

_Program_addSymbol:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 24
    push rax
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+24]
    add rax, 0
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    leave
    ret

_Program_new:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    push 16
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_print_symbols:
    push rbp
    mov rbp, rsp
    sub rsp, 256
.L321:
    mov rax, [rbp+16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L322
    mov rax, str323
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_line_ss
    pop rbx
    pop rbx
    mov rax, [rbp+16]
    add rax, 24
    mov rax, [rax]
    mov [rbp+16], rax
    jmp .L321
.L322:
    leave
    ret

_find_symbol:
    push rbp
    mov rbp, rsp
    sub rsp, 256
.L324:
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    setne al
    cmp rax, 0
    je .L325
    mov rax, [rbp+24]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    push rax
    call _string_eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L326
    mov rax, [rbp+24]
    leave
    ret
    jmp .L327
.L326:
.L327:
    mov rax, [rbp+24]
    add rax, 24
    mov rax, [rax]
    mov [rbp+24], rax
    jmp .L324
.L325:
    mov rax, 0
    leave
    ret
    leave
    ret

_Symbol_new:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    push 72
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 8
    push rax
    mov rax, [rbp+24]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 16
    push rax
    mov rax, 1
    neg rax
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 40
    push rax
    mov rax, str328
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 48
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 56
    push rax
    mov rax, str329
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 32
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 24
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_lex:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    push 16
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 8
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    push rax
    call _lex_list
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-8]
    push rax
    call _LexState_isEnd
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L330
    mov rax, str332
    push rax
    call _print_string
    pop rbx
    call _print_eol
    jmp .L331
.L330:
.L331:
    mov rax, [rbp+-16]
    leave
    ret
    leave
    ret

_print_nodes:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L333
    mov rax, 0
    leave
    ret
    jmp .L334
.L333:
.L334:
    mov rax, str335
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_indent
    pop rbx
    mov rax, str336
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    mov rax, str337
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L338
    mov rax, str340
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 8
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    jmp .L339
.L338:
.L339:
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L341
    mov rax, str343
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 16
    mov rax, [rax]
    push rax
    call _print_string
    pop rbx
    jmp .L342
.L341:
.L342:
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 3
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L344
    mov rax, str346
    push rax
    call _print_string
    pop rbx
    jmp .L345
.L344:
.L345:
    mov rax, [rbp+24]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 2
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L347
    mov rax, str349
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    add rax, 16
    mov rax, [rax]
    push rax
    call _print_string
    pop rbx
    jmp .L348
.L347:
.L348:
    call _print_eol
    mov rax, [rbp+24]
    add rax, 32
    mov rax, [rax]
    mov [rbp+-8], rax
.L350:
    mov rax, [rbp+-8]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L351
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    push rax
    call _print_nodes
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    add rax, 40
    mov rax, [rax]
    mov [rbp+-8], rax
    jmp .L350
.L351:
    leave
    ret

_lex_list:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 3
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    call _Node_new
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, 0
    mov [rbp+-16], rax
.L352:
    mov rax, [rbp+16]
    push rax
    call _LexState_isEnd
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L353
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    mov [rbp+-48], rax
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    mov rax, [rbp+-32]
    push rax
    mov rax, 32
    push rax
    call _eq
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+-32]
    push rax
    mov rax, 10
    push rax
    call _eq
    pop rbx
    pop rbx
    pop rbx
    or rax, rbx
    cmp rax, 0
    je .L354
    jmp .L352
    jmp .L355
.L354:
.L355:
    mov rax, [rbp+-32]
    push rax
    mov rax, 40
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L356
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+16]
    push rax
    call _lex_list
    pop rbx
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    jmp .L352
    jmp .L357
.L356:
.L357:
    mov rax, [rbp+-32]
    push rax
    mov rax, 41
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L358
    jmp .L353
    jmp .L359
.L358:
.L359:
    mov rax, [rbp+-32]
    push rax
    mov rax, 47
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L360
    mov rax, [rbp+16]
    push rax
    mov rax, 47
    push rax
    call _LexState_expect
    pop rbx
    pop rbx
.L362:
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    push rax
    mov rax, 10
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L363
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    jmp .L362
.L363:
    jmp .L352
    jmp .L361
.L360:
.L361:
    mov rax, [rbp+-32]
    push rax
    call _isIdStart
    pop rbx
    cmp rax, 0
    je .L364
.L366:
    mov rax, [rbp+-32]
    push rax
    call _isId
    pop rbx
    cmp rax, 0
    je .L367
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    jmp .L366
.L367:
    mov rax, [rbp+16]
    push rax
    call _LexState_prev
    pop rbx
    mov rax, 0
    push rax
    mov rax, [rbp+-48]
    push rax
    call _Node_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, [rbp+-48]
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    call _slice
    pop rbx
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    jmp .L352
    jmp .L365
.L364:
.L365:
    mov rax, [rbp+-32]
    push rax
    call _isDigit
    pop rbx
    cmp rax, 0
    je .L368
    mov rax, 0
    mov [rbp+-40], rax
.L370:
    mov rax, [rbp+-32]
    push rax
    call _isDigit
    pop rbx
    cmp rax, 0
    je .L371
    mov rax, [rbp+-40]
    push rax
    mov rax, 10
    pop rbx
    mul rbx
    push rax
    mov rax, [rbp+-32]
    pop rbx
    add rax, rbx
    push rax
    mov rax, 48
    push rax
    call _sub
    pop rbx
    pop rbx
    mov [rbp+-40], rax
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    mov [rbp+-32], rax
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    jmp .L370
.L371:
    mov rax, [rbp+16]
    push rax
    call _LexState_prev
    pop rbx
    mov rax, 1
    push rax
    mov rax, [rbp+-48]
    push rax
    call _Node_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 8
    push rax
    mov rax, [rbp+-40]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    jmp .L352
    jmp .L369
.L368:
.L369:
    mov rax, [rbp+-32]
    push rax
    mov rax, 59
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L372
    mov rax, 3
    push rax
    mov rax, [rbp+-48]
    push rax
    call _Node_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 32
    push rax
    mov rax, [rbp+-16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Node_appendChild
    pop rbx
    pop rbx
    mov rax, 0
    mov [rbp+-16], rax
    jmp .L352
    jmp .L373
.L372:
.L373:
    mov rax, [rbp+-32]
    push rax
    mov rax, 34
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L374
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    mov [rbp+-32], rax
.L376:
    mov rax, [rbp+-32]
    push rax
    mov rax, 34
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L377
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _LexState_get
    pop rbx
    mov [rbp+-32], rax
    jmp .L376
.L377:
    mov rax, [rbp+16]
    push rax
    call _LexState_next
    pop rbx
    mov rax, 2
    push rax
    mov rax, [rbp+-48]
    push rax
    call _Node_new
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-24]
    add rax, 16
    push rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, [rbp+-48]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    call _sub
    pop rbx
    pop rbx
    push rax
    call _slice
    pop rbx
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+-24]
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    mov [rbp+-16], rax
    jmp .L352
    jmp .L375
.L374:
.L375:
    mov rax, str378
    push rax
    mov rax, [rbp+-32]
    push rax
    call _print_line_si
    pop rbx
    pop rbx
    jmp .L352
.L353:
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+-16]
    push rax
    call _Node_appendChild
    pop rbx
    pop rbx
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_isId:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _isIdStart
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _isDigit
    pop rbx
    pop rbx
    or rax, rbx
    leave
    ret
    leave
    ret

_isIdStart:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _isAlpha
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 95
    push rax
    call _eq
    pop rbx
    pop rbx
    pop rbx
    or rax, rbx
    leave
    ret
    leave
    ret

_isAlpha:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 97
    push rax
    call _ge
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 122
    push rax
    call _le
    pop rbx
    pop rbx
    pop rbx
    and rax, rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 65
    push rax
    call _ge
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 90
    push rax
    call _le
    pop rbx
    pop rbx
    pop rbx
    and rax, rbx
    pop rbx
    or rax, rbx
    leave
    ret
    leave
    ret

_isDigit:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 48
    push rax
    call _ge
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 57
    push rax
    call _le
    pop rbx
    pop rbx
    pop rbx
    and rax, rbx
    leave
    ret
    leave
    ret

_LexState_expect:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    call _LexState_get
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L379
    mov rax, str381
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_int
    pop rbx
    mov rax, str382
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+24]
    push rax
    call _LexState_get
    pop rbx
    push rax
    call _print_int
    pop rbx
    call _print_eol
    jmp .L380
.L379:
.L380:
    mov rax, [rbp+24]
    push rax
    call _LexState_next
    pop rbx
    leave
    ret

_LexState_isEnd:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    call _length
    pop rbx
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    leave
    ret
    leave
    ret

_LexState_get:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    call _char_at
    pop rbx
    pop rbx
    leave
    ret
    leave
    ret

_LexState_prev:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 8
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    call _sub
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], rax
    leave
    ret

_LexState_next:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 8
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    pop rbx
    mov [rbx], rax
    leave
    ret

_Node_isList:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L383
    mov rax, 0
    leave
    ret
    jmp .L384
.L383:
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 3
    push rax
    call _eq
    pop rbx
    pop rbx
    leave
    ret
.L384:
    leave
    ret

_Node_children:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L385
    mov rax, 0
    leave
    ret
    jmp .L386
.L385:
    mov rax, [rbp+16]
    add rax, 32
    mov rax, [rax]
    leave
    ret
.L386:
    leave
    ret

_Node_next:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L387
    mov rax, 0
    leave
    ret
    jmp .L388
.L387:
    mov rax, [rbp+16]
    add rax, 40
    mov rax, [rax]
    leave
    ret
.L388:
    leave
    ret

_Node_str:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 2
    push rax
    call _eq
    pop rbx
    pop rbx
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+16]
    add rax, 16
    mov rax, [rax]
    leave
    ret
    leave
    ret

_Node_id:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+16]
    add rax, 16
    mov rax, [rax]
    leave
    ret
    leave
    ret

_Node_appendChild:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    add rax, 32
    push rax
    mov rax, [rbp+24]
    add rax, 32
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], rax
    leave
    ret

_Node_append_last:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L389
    mov rax, [rbp+16]
    leave
    ret
    jmp .L390
.L389:
.L390:
    mov rax, [rbp+24]
    add rax, 40
    mov rax, [rax]
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L391
    mov rax, [rbp+24]
    add rax, 40
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+24]
    leave
    ret
    jmp .L392
.L391:
.L392:
    mov rax, [rbp+24]
    add rax, 40
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    push rax
    call _Node_append_last
    pop rbx
    pop rbx
    mov rax, [rbp+24]
    leave
    ret
    leave
    ret

_print_node_pos:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, str393
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    add rax, 48
    mov rax, [rax]
    push rax
    call _print_int
    pop rbx
    leave
    ret

_Node_new:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    push 56
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, [rbp+24]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 8
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 16
    push rax
    mov rax, str394
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 24
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 32
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 40
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 48
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_exit_success:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 60
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    pop rdx
    pop rsi
    pop rdi
    pop rax
    syscall
    leave
    ret
    leave
    ret

_assert:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    cmp rax, 0
    je .L395
    mov rax, str397
    push rax
    mov rax, [rbp+16]
    push rax
    call _print_line_si
    pop rbx
    pop rbx
    int 3 ; cannot stat exit_failure
    jmp .L396
.L395:
.L396:
    leave
    ret

_read_file:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _open_file
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    push rax
    mov rax, 0
    push rax
    call _gt
    pop rbx
    pop rbx
    push rax
    call _assert
    pop rbx
    push 16
    call _allocate
    pop rbx
    mov [rbp+-16], rax
    mov rax, [rbp+-16]
    add rax, 8
    push rax
    mov rax, 65536
    push rax
    call _allocate
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+-16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, 65536
    push rax
    call _read_from_fd
    pop rbx
    pop rbx
    pop rbx
    mov [rbp+-24], rax
    mov rax, [rbp+-16]
    add rax, 0
    push rax
    mov rax, [rbp+-24]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-16]
    leave
    ret
    leave
    ret

_read_from_fd:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 0
    push rax
    mov rax, [rbp+32]
    push rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    pop rdx
    pop rsi
    pop rdi
    pop rax
    syscall
    leave
    ret
    leave
    ret

_open_file:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _make_c_string
    pop rbx
    mov [rbp+-16], rax
    mov rax, 2
    push rax
    mov rax, [rbp+-16]
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    pop rdx
    pop rsi
    pop rdi
    pop rax
    syscall
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_parse_c_string:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 0
    mov [rbp+-16], rax
.L398:
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+-16]
    pop rbx
    add rax, rbx
    mov rbx, rax
    xor rax, rax
    mov al, [rbx]
    push rax
    mov rax, 0
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L399
    mov rax, [rbp+-16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-16], rax
    jmp .L398
.L399:
    push 16
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, [rbp+-16]
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 8
    push rax
    mov rax, [rbp+-16]
    push rax
    call _allocate
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, 0
    mov [rbp+-16], rax
.L400:
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+-8]
    add rax, 0
    mov rax, [rax]
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L401
    mov rax, [rbp+-8]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+-16]
    pop rbx
    add rax, rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+-16]
    pop rbx
    add rax, rbx
    mov rbx, rax
    xor rax, rax
    mov al, [rbx]
    pop rbx
    mov [rbx], al
    mov rax, [rbp+-16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-16], rax
    jmp .L400
.L401:
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_make_c_string:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _length
    pop rbx
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    push rax
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, 0
    mov [rbp+-16], rax
.L402:
    mov rax, [rbp+-16]
    push rax
    mov rax, [rbp+16]
    push rax
    call _length
    pop rbx
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L403
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+-16]
    pop rbx
    add rax, rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+-16]
    push rax
    call _char_at
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], al
    mov rax, [rbp+-16]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-16], rax
    jmp .L402
.L403:
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+-16]
    pop rbx
    add rax, rbx
    push rax
    mov rax, 0
    pop rbx
    mov [rbx], al
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_sub:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    neg rax
    pop rbx
    add rax, rbx
    leave
    ret
    leave
    ret

_le:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    push rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _eq
    pop rbx
    pop rbx
    pop rbx
    or rax, rbx
    leave
    ret
    leave
    ret

_ge:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _gt
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _eq
    pop rbx
    pop rbx
    pop rbx
    or rax, rbx
    leave
    ret
    leave
    ret

_eq:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    push rax
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+16]
    push rax
    call _gt
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    pop rbx
    and rax, rbx
    leave
    ret
    leave
    ret

_gt:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+24]
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    leave
    ret
    leave
    ret

_allocate:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    lea rax, [heap_memory]
    mov rax, [rax]
    push rax
    mov rax, 8
    pop rbx
    add rax, rbx
    mov [rbp+-8], rax
    lea rax, [heap_memory]
    push rax
    mov rax, 0
    pop rbx
    add rax, rbx
    push rax
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+16]
    pop rbx
    add rax, rbx
    pop rbx
    mov [rbx], rax
    lea rax, [heap_memory]
    push rax
    mov rax, [rbp+-8]
    pop rbx
    add rax, rbx
    leave
    ret
    leave
    ret

_print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 0
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L404
    mov rax, 45
    push rax
    call _print_char
    pop rbx
    mov rax, [rbp+16]
    neg rax
    mov [rbp+16], rax
    jmp .L405
.L404:
.L405:
    mov rax, [rbp+16]
    push rax
    call _print_int_rec
    pop rbx
    leave
    ret

_print_int_rec:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 10
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L406
    mov rax, [rbp+16]
    push rax
    call _print_digit
    pop rbx
    jmp .L407
.L406:
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, 10
    pop rbx
    xchg rax, rbx
    cqo
    idiv rbx
    push rax
    mov rax, 10
    pop rbx
    mul rbx
    push rax
    call _sub
    pop rbx
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+16]
    push rax
    mov rax, 10
    pop rbx
    xchg rax, rbx
    cqo
    idiv rbx
    push rax
    call _print_int_rec
    pop rbx
    mov rax, [rbp+-8]
    push rax
    call _print_digit
    pop rbx
.L407:
    leave
    ret

_print_eol:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 10
    push rax
    call _print_char
    pop rbx
    leave
    ret

_print_char:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    mov [rbp+-8], rax
    mov rax, 1
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp+-8]
    push rax
    mov rax, 1
    push rax
    pop rdx
    pop rsi
    pop rdi
    pop rax
    syscall
    mov [rbp+-8], rax
    leave
    ret

_print_string:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 1
    push rax
    mov rax, 1
    push rax
    mov rax, [rbp+16]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    pop rax
    syscall
    mov [rbp+-8], rax
    leave
    ret

_string_eq:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    call _length
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    call _length
    pop rbx
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L408
    mov rax, 0
    leave
    ret
    jmp .L409
.L408:
.L409:
    mov rax, 0
    mov [rbp+-8], rax
.L410:
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+24]
    push rax
    call _length
    pop rbx
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L411
    mov rax, [rbp+24]
    push rax
    mov rax, [rbp+-8]
    push rax
    call _char_at
    pop rbx
    pop rbx
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+-8]
    push rax
    call _char_at
    pop rbx
    pop rbx
    push rax
    call _eq
    pop rbx
    pop rbx
    mov rbx, rax
    xor rax, rax
    test rbx, rbx
    sete al
    cmp rax, 0
    je .L412
    mov rax, 0
    leave
    ret
    jmp .L413
.L412:
.L413:
    mov rax, [rbp+-8]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-8], rax
    jmp .L410
.L411:
    mov rax, 1
    leave
    ret
    leave
    ret

_slice:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    push 16
    call _allocate
    pop rbx
    mov [rbp+-8], rax
    mov rax, [rbp+-8]
    add rax, 0
    push rax
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+24]
    push rax
    call _sub
    pop rbx
    pop rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    add rax, 8
    push rax
    mov rax, [rbp+32]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+24]
    pop rbx
    add rax, rbx
    pop rbx
    mov [rbx], rax
    mov rax, [rbp+-8]
    leave
    ret
    leave
    ret

_char_at:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    mov rax, 0
    push rax
    call _ge
    pop rbx
    pop rbx
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+16]
    push rax
    mov rax, [rbp+24]
    push rax
    call _length
    pop rbx
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    push rax
    call _assert
    pop rbx
    mov rax, [rbp+24]
    add rax, 8
    mov rax, [rax]
    push rax
    mov rax, [rbp+16]
    pop rbx
    add rax, rbx
    mov rbx, rax
    xor rax, rax
    mov al, [rbx]
    leave
    ret
    leave
    ret

_length:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    add rax, 0
    mov rax, [rax]
    leave
    ret
    leave
    ret

_print_digit:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 48
    push rax
    mov rax, [rbp+16]
    pop rbx
    add rax, rbx
    push rax
    call _print_char
    pop rbx
    leave
    ret

_nop:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    leave
    ret

_print_line_si:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_int
    pop rbx
    call _print_eol
    leave
    ret

_print_line_ss:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+24]
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_print_line:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, [rbp+16]
    push rax
    call _print_string
    pop rbx
    call _print_eol
    leave
    ret

_print_indent:
    push rbp
    mov rbp, rsp
    sub rsp, 256
    mov rax, 0
    mov [rbp+-8], rax
.L414:
    mov rax, [rbp+-8]
    push rax
    mov rax, [rbp+16]
    pop rbx
    mov rcx, rax
    xor rax, rax
    cmp rbx, rcx
    setl al
    movsx rax, al
    cmp rax, 0
    je .L415
    mov rax, str416
    push rax
    call _print_string
    pop rbx
    mov rax, [rbp+-8]
    push rax
    mov rax, 1
    pop rbx
    add rax, rbx
    mov [rbp+-8], rax
    jmp .L414
.L415:
    leave
    ret
section .rodata
str416: dq 2, strdata416
str397: dq 18, strdata397
str394: dq 0, strdata394
str393: dq 10, strdata393
str382: dq 5, strdata382
str381: dq 16, strdata381
str378: dq 20, strdata378
str349: dq 7, strdata349
str346: dq 4, strdata346
str343: dq 3, strdata343
str340: dq 4, strdata340
str337: dq 1, strdata337
str336: dq 2, strdata336
str335: dq 1, strdata335
str332: dq 28, strdata332
str329: dq 0, strdata329
str328: dq 0, strdata328
str323: dq 9, strdata323
str320: dq 16, strdata320
str317: dq 3, strdata317
str312: dq 5, strdata312
str307: dq 4, strdata307
str302: dq 8, strdata302
str299: dq 11, strdata299
str296: dq 7, strdata296
str291: dq 20, strdata291
str290: dq 6, strdata290
str287: dq 7, strdata287
str284: dq 1, strdata284
str281: dq 5, strdata281
str276: dq 4, strdata276
str275: dq 1, strdata275
str274: dq 2, strdata274
str273: dq 4, strdata273
str272: dq 4, strdata272
str271: dq 7, strdata271
str270: dq 7, strdata270
str269: dq 7, strdata269
str268: dq 7, strdata268
str267: dq 7, strdata267
str266: dq 8, strdata266
str265: dq 8, strdata265
str264: dq 8, strdata264
str263: dq 8, strdata263
str262: dq 7, strdata262
str259: dq 13, strdata259
str258: dq 7, strdata258
str257: dq 12, strdata257
str256: dq 12, strdata256
str255: dq 12, strdata255
str254: dq 7, strdata254
str253: dq 8, strdata253
str252: dq 2, strdata252
str249: dq 7, strdata249
str248: dq 3, strdata248
str245: dq 8, strdata245
str244: dq 3, strdata244
str243: dq 13, strdata243
str242: dq 7, strdata242
str241: dq 8, strdata241
str240: dq 3, strdata240
str237: dq 7, strdata237
str236: dq 7, strdata236
str235: dq 8, strdata235
str234: dq 3, strdata234
str231: dq 11, strdata231
str230: dq 7, strdata230
str229: dq 8, strdata229
str228: dq 2, strdata228
str225: dq 12, strdata225
str224: dq 7, strdata224
str223: dq 8, strdata223
str222: dq 3, strdata222
str219: dq 12, strdata219
str218: dq 7, strdata218
str217: dq 8, strdata217
str216: dq 3, strdata216
str213: dq 8, strdata213
str212: dq 13, strdata212
str211: dq 12, strdata211
str210: dq 12, strdata210
str209: dq 8, strdata209
str206: dq 7, strdata206
str205: dq 13, strdata205
str204: dq 12, strdata204
str203: dq 12, strdata203
str202: dq 7, strdata202
str199: dq 7, strdata199
str198: dq 13, strdata198
str197: dq 12, strdata197
str196: dq 12, strdata196
str195: dq 3, strdata195
str192: dq 7, strdata192
str191: dq 14, strdata191
str190: dq 0, strdata190
str189: dq 5, strdata189
str188: dq 3, strdata188
str185: dq 22, strdata185
str184: dq 9, strdata184
str181: dq 13, strdata181
str180: dq 12, strdata180
str179: dq 12, strdata179
str178: dq 16, strdata178
str175: dq 14, strdata175
str174: dq 11, strdata174
str171: dq 1, strdata171
str170: dq 14, strdata170
str169: dq 10, strdata169
str166: dq 10, strdata166
str163: dq 14, strdata163
str162: dq 0, strdata162
str161: dq 9, strdata161
str156: dq 4, strdata156
str153: dq 0, strdata153
str152: dq 12, strdata152
str149: dq 0, strdata149
str148: dq 9, strdata148
str145: dq 1, strdata145
str144: dq 14, strdata144
str143: dq 0, strdata143
str142: dq 9, strdata142
str139: dq 11, strdata139
str136: dq 10, strdata136
str135: dq 4, strdata135
str130: dq 0, strdata130
str129: dq 7, strdata129
str126: dq 6, strdata126
str125: dq 8, strdata125
str122: dq 29, strdata122
str119: dq 20, strdata119
str118: dq 3, strdata118
str117: dq 5, strdata117
str116: dq 6, strdata116
str113: dq 0, strdata113
str112: dq 6, strdata112
str111: dq 5, strdata111
str108: dq 0, strdata108
str107: dq 6, strdata107
str106: dq 8, strdata106
str103: dq 0, strdata103
str102: dq 6, strdata102
str101: dq 0, strdata101
str100: dq 5, strdata100
str99: dq 10, strdata99
str98: dq 5, strdata98
str93: dq 0, strdata93
str92: dq 6, strdata92
str91: dq 0, strdata91
str90: dq 5, strdata90
str89: dq 10, strdata89
str88: dq 2, strdata88
str85: dq 10, strdata85
str82: dq 14, strdata82
str81: dq 7, strdata81
str80: dq 8, strdata80
str79: dq 0, strdata79
str78: dq 9, strdata78
str73: dq 4, strdata73
str70: dq 6, strdata70
str69: dq 9, strdata69
str68: dq 22, strdata68
str65: dq 3, strdata65
str62: dq 5, strdata62
str59: dq 13, strdata59
str58: dq 7, strdata58
str57: dq 8, strdata57
str56: dq 17, strdata56
str53: dq 14, strdata53
str52: dq 7, strdata52
str51: dq 8, strdata51
str50: dq 12, strdata50
str41: dq 0, strdata41
str40: dq 36, strdata40
str37: dq 29, strdata37
str36: dq 12, strdata36
str35: dq 5, strdata35
str34: dq 7, strdata34
str31: dq 9, strdata31
str30: dq 5, strdata30
str29: dq 3, strdata29
str26: dq 15, strdata26
str25: dq 3, strdata25
str24: dq 5, strdata24
str17: dq 12, strdata17
str16: dq 12, strdata16
str15: dq 8, strdata15
str14: dq 1, strdata14
str13: dq 1, strdata13
str8: dq 9, strdata8
str7: dq 7, strdata7
str6: dq 7, strdata6
str5: dq 13, strdata5
str4: dq 13, strdata4
str3: dq 0, strdata3
strdata416: db "  "
strdata397: db "assertion failed: "
strdata394: db ""
strdata393: db "node pos: "
strdata382: db " got "
strdata381: db "ERROR expecting "
strdata378: db "lexer: unknown char "
strdata349: db "string "
strdata346: db "list"
strdata343: db "id "
strdata340: db "int "
strdata337: db " "
strdata336: db "| "
strdata335: db ";"
strdata332: db "parsing stopped unexpectedly"
strdata329: db ""
strdata328: db ""
strdata323: db "; symbol "
strdata320: db "bad declaration "
strdata317: db "fun"
strdata312: db "class"
strdata307: db "enum"
strdata302: db "compiler"
strdata299: db "conditional"
strdata296: db "include"
strdata291: db "; begin translation "
strdata290: db "params"
strdata287: db "members"
strdata284: db " "
strdata281: db "local"
strdata276: db "    "
strdata275: db ":"
strdata274: db ".L"
strdata273: db "    "
strdata272: db "    "
strdata271: db "syscall"
strdata270: db "pop rax"
strdata269: db "pop rdi"
strdata268: db "pop rsi"
strdata267: db "pop rdx"
strdata266: db "push rax"
strdata265: db "push rax"
strdata264: db "push rax"
strdata263: db "push rax"
strdata262: db "syscall"
strdata259: db "movsx rax, al"
strdata258: db "setl al"
strdata257: db "cmp rbx, rcx"
strdata256: db "xor rax, rax"
strdata255: db "mov rcx, rax"
strdata254: db "pop rbx"
strdata253: db "push rax"
strdata252: db "lt"
strdata249: db "neg rax"
strdata248: db "neg"
strdata245: db "idiv rbx"
strdata244: db "cqo"
strdata243: db "xchg rax, rbx"
strdata242: db "pop rbx"
strdata241: db "push rax"
strdata240: db "div"
strdata237: db "mul rbx"
strdata236: db "pop rbx"
strdata235: db "push rax"
strdata234: db "mul"
strdata231: db "or rax, rbx"
strdata230: db "pop rbx"
strdata229: db "push rax"
strdata228: db "or"
strdata225: db "and rax, rbx"
strdata224: db "pop rbx"
strdata223: db "push rax"
strdata222: db "and"
strdata219: db "add rax, rbx"
strdata218: db "pop rbx"
strdata217: db "push rax"
strdata216: db "add"
strdata213: db "setne al"
strdata212: db "test rbx, rbx"
strdata211: db "xor rax, rax"
strdata210: db "mov rbx, rax"
strdata209: db "not_null"
strdata206: db "sete al"
strdata205: db "test rbx, rbx"
strdata204: db "xor rax, rax"
strdata203: db "mov rbx, rax"
strdata202: db "is_null"
strdata199: db "sete al"
strdata198: db "test rbx, rbx"
strdata197: db "xor rax, rax"
strdata196: db "mov rbx, rax"
strdata195: db "not"
strdata192: db "pop rbx"
strdata191: db "call _allocate"
strdata190: db ""
strdata189: db "push "
strdata188: db "new"
strdata185: db "lea rax, [heap_memory]"
strdata184: db "heap_addr"
strdata181: db "mov al, [rbx]"
strdata180: db "xor rax, rax"
strdata179: db "mov rbx, rax"
strdata178: db "memory_read_byte"
strdata175: db "mov rax, [rax]"
strdata174: db "memory_read"
strdata171: db "]"
strdata170: db "lea rax, [rbp+"
strdata169: db "address_of"
strdata166: db "not found "
strdata163: db "mov rax, [rax]"
strdata162: db ""
strdata161: db "add rax, "
strdata156: db "getm"
strdata153: db ""
strdata152: db "mov rax, str"
strdata149: db ""
strdata148: db "mov rax, "
strdata145: db "]"
strdata144: db "mov rax, [rbp+"
strdata143: db ""
strdata142: db "mov rax, "
strdata139: db "bad symbol "
strdata136: db "mov rax, 0"
strdata135: db "NULL"
strdata130: db ""
strdata129: db "pop rbx"
strdata126: db "call _"
strdata125: db "push rax"
strdata122: db "int 3 ; cannot function call "
strdata119: db "int 3 ; cannot stat "
strdata118: db "ret"
strdata117: db "leave"
strdata116: db "return"
strdata113: db ""
strdata112: db "jmp .L"
strdata111: db "break"
strdata108: db ""
strdata107: db "jmp .L"
strdata106: db "continue"
strdata103: db ""
strdata102: db "jmp .L"
strdata101: db ""
strdata100: db "je .L"
strdata99: db "cmp rax, 0"
strdata98: db "while"
strdata93: db ""
strdata92: db "jmp .L"
strdata91: db ""
strdata90: db "je .L"
strdata89: db "cmp rax, 0"
strdata88: db "if"
strdata85: db "not found "
strdata82: db "mov [rbx], rax"
strdata81: db "pop rbx"
strdata80: db "push rax"
strdata79: db ""
strdata78: db "add rax, "
strdata73: db "setm"
strdata70: db "], rax"
strdata69: db "mov [rbp+"
strdata68: db "set: symbol not found:"
strdata65: db "set"
strdata62: db "local"
strdata59: db "mov [rbx], al"
strdata58: db "pop rbx"
strdata57: db "push rax"
strdata56: db "memory_write_byte"
strdata53: db "mov [rbx], rax"
strdata52: db "pop rbx"
strdata51: db "push rax"
strdata50: db "memory_write"
strdata41: db ""
strdata40: db "int 3 ; should be list in statement "
strdata37: db "heap_memory: resb 8*1024*1024"
strdata36: db "section .bss"
strdata35: db ": db "
strdata34: db "strdata"
strdata31: db ", strdata"
strdata30: db ": dq "
strdata29: db "str"
strdata26: db "section .rodata"
strdata25: db "ret"
strdata24: db "leave"
strdata17: db "sub rsp, 256"
strdata16: db "mov rbp, rsp"
strdata15: db "push rbp"
strdata14: db ":"
strdata13: db "_"
strdata8: db "jmp _main"
strdata7: db "pop rax"
strdata6: db "_start:"
strdata5: db "global _start"
strdata4: db "section .text"
strdata3: db ""
section .bss
heap_memory: resb 8*1024*1024

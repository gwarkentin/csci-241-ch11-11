; Program: Linked_List_Insertion_and_Display (Chapter 11, Pr 11)
; Description: Implement singly linked list with dynamic memory allocation
; Student:     Gabriel Warkentin
; Date:        05/19/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

heapmin = 10
heapmax = 30

.data
NODE STRUCT
   intVal SDWORD ?
   pNext DWORD ?
NODE ENDS
hHeap DWORD ?
dummyhead NODE <0,0>

msg1 BYTE "Enter a signed integer note value (zero to end): ",0
msg2 BYTE "Contents of linked list:",0dh,0ah
     BYTE "Dummy head",0
msgfail BYTE "FAIL: could not allocate heap. Error: ",0
arrow BYTE " -> ",0

.code

mainll PROC
    INVOKE HeapCreate , NULL, SIZEOF NODE * heapmin, SIZEOF NODE * heapmax
    cmp eax, NULL
    je Lfail
    mov hHeap, eax
    mov esi, OFFSET dummyhead

L1:
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    cmp eax, 0
    je Loutput
    mov ebx, eax
    INVOKE HeapAlloc, hHeap, HEAP_ZERO_MEMORY, SIZEOF NODE
    cmp eax, NULL
    je Loutput
    mov (NODE PTR [esi]).pNext, eax
    mov esi, eax
    mov (NODE PTR [esi]).intVal, ebx
    jmp L1

Loutput:
    mov edx, OFFSET msg2
    call WriteString
    mov esi, dummyhead.pNext

L2:
    cmp esi, 0
    je Lexit
    mov edx, OFFSET arrow
    call WriteString
    mov eax, (NODE PTR [esi]).intVal
    call WriteInt
    mov edi, (NODE PTR [esi]).pNext
    INVOKE HeapFree, hHeap, 0, esi
    mov esi, edi
    jmp L2

Lfail:
    mov edx, OFFSET msgfail
    call WriteString
    INVOKE GetLastError
    call WriteHex
Lexit:
    INVOKE HeapDestroy, hHeap
    call CrLf
    call WaitMsg
    exit
mainll ENDP

END mainll
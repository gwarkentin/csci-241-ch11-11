# csci-241-ch11-11
Linked_List_Insertion_and_Display 

Implement a singly linked list, using the dynamic memory allocation functions presented in this chapter. Each node should be a structure named Node containing an integer value and a pointer to the next link in the list like:
NODE STRUCT
   intVal SDWORD ?
   pNext DWORD ?
NODE ENDS
PNODE TYPEDEF PTR NODE
To create a node, simply call
INVOKE HeapAlloc, hHeap, HEAP_ZERO_MEMORY, SIZEOF NODE
Using a loop, to let the user control the number of values input. When zero is entered, stop the loop. As each non-zero integer is entered, allocate a Node object, move the integer value in the Node, and append the Node to the linked list. Finally, display the entire list from beginning to end like the following, as with ch11_11.exe,
Enter a signed integer node value (zero to end): 11
Enter a signed integer node value (zero to end): -2
Enter a signed integer node value (zero to end): 333
Enter a signed integer node value (zero to end): 0

Contents of linked list:
Dummy Head -> +11 -> -2 -> +333
The following two concepts are strongly suggested to understand before you start:
Create a singly linked list with a dummy head that will simplify the insertion operation without you differentiating empty list and non-empty in insertion
- For help, refer to this guide
An easy way to maitain the original sequence in display, define the following to understand the tail insertion in the linked list
head NODE <0,0> ; Dummy head
pTailNode PNODE ?
pCurrNode PNODE ?
To be efficient, instead of using pTailNode and pCurrNode, using two registers like ESI and EDI can be a necessary consideration. Finally, don't forget to free all dynamically allocated nodes when done. So the following steps are suggested:
Initialization to get or create a heap
Repeatedly prompt for a signed integer and create a node to connect
Display the list of nodes
Release all the heap memory created
If well designed, the last two steps can be done in one loop.
To test your code in the real world, a test case could be an empty list, one node, or more than one node list.

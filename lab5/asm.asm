				.586
				.model flat
				.code
				public _ADD1
				externdef _PR:near	;������������ �� C++
_ADD1 proc
				push EBP
				mov  EBP,ESP
				push ESI
				push EDI
				push EAX
				push EBX
				push EDX
				xor  EDX,EDX
			    mov  EDI,[EBP+8]	;��������� ����� ������ Str1
		        mov  ESI,[EBP+12]	;��������� n
				
				cld
				mov EDX, ESI ; ��������

				cycle1:
					add EDI, ESI	; ������ ��������� �� n-�� ������
					mov AL, 0		; ���� �� ��������� ����� ������
					scasb
				    je continue		; ���� ����� ������
				    mov EBX, ESI	; ���������� �������� � ������ = n
					dec EDI			; ����������� � �������� �������
					mov AL, ' '
					cycle2:
						scasb		; �������� ������ �� ������
						je next_str ; ������� �� �����
						inc EBX		; ���������� ��������
					jmp cycle2
         
				    next_str:
					cmp EDX, EBX	; ��������� � ���������� 
					jge mx			; ������� �� ������ ��� �����
					mov EDX, EBX	; �������� ����� ��������
					mx: 
					dec EDI			;���������� � �������� �������
					mov AL, 10
					mov [EDI], AL	; ����� ������ �� ������ ����� ������
					inc EDI			; �������� � ���������� �������
			    jmp cycle1
         
				continue:			; �������������� ������ ��� ���������� ������
				mov AL, 0
				cyc:
			    dec EDI
				cmp [EDI], AL
				je cyc
				mov AL, ' '
				cmp [EDI], AL
				je next
				inc EDI
				next:
				mov AL, 10
				mov [EDI], AL
				inc EDI
				mov AL, 0
				mov [EDI],AL

				mov ESI, [EBP+8] ; ��������� ����� ������ � ESI
				push EDX		  ; ��������� �������� � ����
				push ESI		  ; ��������� ����� ������ � ����
				call _PR	  ; ����� ���������	
				pop ESI
				pop EDX

				pop  EDX
				pop  EBX
				pop  EAX
				pop  EDI
				pop  ESI
				pop  EBP
				ret
_ADD1 endp
	  end
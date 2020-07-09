				.586
				.model flat
				.code
				public _ADD1
				externdef _PR:near	;подпрограмма на C++
_ADD1 proc
				push EBP
				mov  EBP,ESP
				push ESI
				push EDI
				push EAX
				push EBX
				push EDX
				xor  EDX,EDX
			    mov  EDI,[EBP+8]	;записываю адрес строки Str1
		        mov  ESI,[EBP+12]	;записываю n
				
				cld
				mov EDX, ESI ; максимум

				cycle1:
					add EDI, ESI	; ставлю указатель на n-ый символ
					mov AL, 0		; пока не достигнут конец строки
					scasb
				    je continue		; если конец строки
				    mov EBX, ESI	; количество символов в строке = n
					dec EDI			; возвращаюсь к текущему символу
					mov AL, ' '
					cycle2:
						scasb		; проверяю символ на пробел
						je next_str ; переход по равно
						inc EBX		; увеличиваю максимум
					jmp cycle2
         
				    next_str:
					cmp EDX, EBX	; сравниваю с максимумом 
					jge mx			; переход по больше или равно
					mov EDX, EBX	; назначаю новый максимум
					mx: 
					dec EDI			;возращаюсь к текущему символу
					mov AL, 10
					mov [EDI], AL	; меняю пробел на символ новой строки
					inc EDI			; перехожу к следующему символу
			    jmp cycle1
         
				continue:			; преобразования строки для дальнешней работы
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

				mov ESI, [EBP+8] ; записываю адрес строки в ESI
				push EDX		  ; записываю максимум в стек
				push ESI		  ; записываю адрес строки в стек
				call _PR	  ; вызов процедуры	
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
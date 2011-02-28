function out = roundn(in, n)

if n <= 0
	out = round(in);
	return
end

Nfact = 10^n;

if isreal(in)
	out = round(in * Nfact)./Nfact;
else	
	
	in_real = real(in);
	in_imag = imag(in);

	out_real = round(in_real * Nfact)./Nfact;
	out_imag	= round(in_imag * Nfact)./Nfact;
	out = complex(out_real, out_imag);
end


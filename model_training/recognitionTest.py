import matlab.engine
# Run 'matlab.engine.shareEngine' in MATLAB
matlab.engine.find_matlab()
names = matlab.engine.find_matlab()
if names:
    eng = matlab.engine.connect_matlab(names[0])
else:
    eng = matlab.engine.start_matlab('-desktop')
r=eng.recognize('captcha.png')
print(r)
au BufNewFile,BufRead *
	\ if match(getline(1), '#!/usr/bin/env osascript') == 0
	\|  setf javascript
	\|endif

au BufNewFile,BufRead *
	\ if match(getline(1), '#!/usr/bin/env node') == 0
	\|  setf javascript
	\|endif


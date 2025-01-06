; ((htmlContent) @injection.content
;  (#set! injection.language "html")
;  (#set! injection.combined))

((latteContent (phpFunction) @injection.content
  (#set! injection.language "php")
  (#set! injection.combined)))

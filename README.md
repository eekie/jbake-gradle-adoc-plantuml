
`gradle bake --continuous`

The output will be generated in build/output

To the make `<img src="/img/..."` work in generated html you best serve the output over http. 

We could create a gradle task to serve content with gretty.
but for now we just use jbake command to serve content.

install jbake with
`brew install jbake`


serve static content with
`jbake -s build/output`

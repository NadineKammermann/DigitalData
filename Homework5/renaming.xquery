(: Finally, eXist lets you update your data! These Shakespeare files are 
   simple transcriptions of a printed edition, without any sort of 
   standardization or interpretation applied. In particular, the speaker
   names are spelled all sorts of different ways. Since we are working with
   documents in an eXist database, as opposed to documents on your filesystem
   or on the web, we can fix this! 
   
   Now have a look at the file xml_examples/xquery_examples/example_9.xquery 
   This is our example in class of how to update files in eXist. Use this as a template to 
   do your own data cleanup on your choice of play. Look for the different variants of a 
   single name and put them in $variants, and put the canonical form of the name in $correct_name. 
   Let loose your perfectionist tendencies! (Or borrow some perfectionist tendencies from a friend.):)
   
declare namespace tei = 'http://www.tei-c.org/ns/1.0';
let $correct_name := 'Wife'
let $variants := ('Wife.')
for $speaker in doc('shakespeare/5696.xml')//tei:speaker
return
    if (index-of($variants, $speaker)) then
        update value $speaker with $correct_name 
    else
        ''
        
(: You won't see much of anything in your results box, but if you close
   and re-open your file, you'll see that all the Bedford parts are now
   listed as 'Bedford'! :)
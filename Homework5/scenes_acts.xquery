(: Finally, eXist lets you update your data! These Shakespeare files are 
   simple transcriptions of a printed edition, without any sort of 
   standardization or interpretation applied. In particular, the speaker
   names are spelled all sorts of different ways. Since we are working with
   documents in an eXist database, as opposed to documents on your filesystem
   or on the web, we can fix this! 
   
   Look for other things to update in the same way, in the plays. For example, 
   you could add a 'type' attribute to distinguish the headers for acts from the headers for scenes. 
   Or else you could number them with an 'n' attribute. Here's how you add an attribute to an element in eXist XQuery:

update insert attribute name {'value'} into $element

where name is the attribute name, value is the attribute value, and the variable called $element 
contains the element that you want to add the attribute to.:)
   
declare namespace tei = 'http://www.tei-c.org/ns/1.0';

   for $head in doc('5696.xml')//tei:text//tei:head
        where starts-with($head, 'Scena')
        return
        update insert attribute name {'scene'} into $head
 

(: You won't see much of anything in your results box, but if you close
   and re-open your file, you'll see that all the Bedford parts are now
   listed as 'Bedford'! :)
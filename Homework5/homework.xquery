declare namespace tei = 'http://www.tei-c.org/ns/1.0';
(: Make me a list of all the play titles in your Shakespeare collection, wrapped in a <title> element inside a <play> element.

Now get the list of characters in each play. The characters appear in the plays as the text of the <speaker> element. 
Put each of them in your own <speaker> element, after the <title> inside your <play>.
You'll have a huge list from the above! You can make it smaller with the XPath/XQuery function distinct-values(). So, for example,

for $part in distinct-values($play//tei:speaker)

Change your XQuery so that you are listing only the distinct speakers

ERROR cannot convert xs:untypedAtomic('King.') to a node set

Now you'll probably start to see examples of the same speaker spelled in different ways. You can make this more obvious using an 'order by' statement, which is the O in FLWOR. Just put a line

order by $speaker

directly underneath the for statement from the last step.:)


<plays>{
    for $play in collection('shakespeare')
        return
    <play>
        <title>{$play//tei:fileDesc/tei:titleStmt/tei:title/text()}</title>
     <speakers>{
     for $speaker in $play//tei:speaker
        order by $speaker
        return
     <speaker>{$speaker/text()}</speaker>
     }</speakers>
     </play>
    }
</plays>
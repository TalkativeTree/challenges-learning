Parsing an Email

What do we mean by parse an email? Go to Gmail, open an incoming email, and do View Original. You should see a text file of a raw email. The goal here is to parse that and extract relevant fields.

This is actually a very difficult thing and a proper implementation could take months. However, it's possible to do the basics, without handling all of the intricacies, in maybe an hour.

Your goals:

Take in an email and parse it into relevant fields. Figure out what those relevant fields are.
Create a good foundation. Try to write extensible/maintainable code.
When you're done, list out next steps you'd take in your implementation. Eg, 'I'd focus on handling different MIME types in the body', etc.
Don't use a library like TMail that does parsing for you, but feel free to use any non-email-specific libraries.
A few notes about your goals:

The directions are purposefully vague. Make decisions on what you think is best for the goal you're trying to accomplish. Feel free to tell us why you made certain decisions in your summary.
Use the RFC Email Specs as a starting point to help you parse the email.
Google is your friend!
/* *******************************************************************
 *  Name:    Eesha Agarwal
 *  NetID:   eagarwal
 *  Precept: P08
 *  Filename: decomment.c
 *
 *  Description: Performs a subset of the de-comment job of the C
 *  preprocessor by replacing comments with whitespace, taking into
 *  account string and character literal boundaries and maintaining
 *  original line numbers.
 ******************************************************************* */


#include <stdio.h>
#include <ctype.h>

enum Statetype {NORMAL, IN_STRING, IN_CHAR, SLASH, STAR, IN_COMMENT,
                 ESCAPE_IN_CHAR, ESCAPE_IN_STRING};

/* Implement the NORMAL state of the DFA. c is the current DFA
   character. Write c to stdout or move to SLASH state to check
   if c is the beginning of a comment, as specified by the DFA.
   Return the next state. */

enum Statetype handleNormalState(int c) {
      enum Statetype state;

      /* Move to IN_STRING state if double quote character is
         found. */
      if (c == '\"') {
         state = IN_STRING;
         putchar(c);
      }

      /* Move to IN_CHAR state if single quote character is
         found. */
      else if (c == '\'') {
         state = IN_CHAR;
         putchar(c);
      }

      /* Move to SLASH state if  slash character is
         found. */
      else if (c == '/') {
         state = SLASH;
      }

      /* Else stay in NORMAL state. */
      else {
         state = NORMAL;
         putchar(c);
      }
      return state;
}

/* Implement the IN_STRING state of the DFA. c is the current DFA
   character. Write c to stdout, as specified by the DFA. Do not
   consider any text within the string literal to be a comment.
   Handle escaped chracters. Return the next state. */

enum Statetype handleInStringState(int c) {
      enum Statetype state;

      /* Move back to NORMAL state if double quote character is
         found. */
      if (c == '\"') {
         state = NORMAL;
         putchar(c);
      }

      /* Move to ESCAPE_IN_STRING state to handle escaped
         characters following a backslash. */
      else if (c == '\\') {
         putchar(c);
         state = ESCAPE_IN_STRING;
      }
      /* Else stay in IN_STRING state. */
      else {
         state = IN_STRING;
         putchar(c);
      }
      return state;
   }

/* Implement the IN_CHAR state of the DFA. c is the current DFA
   character. Write c to stdout, as specified by the DFA. Do not
   consider any text within the char literal to be a comment.
   Handle escaped chracters. Return the next state. */

enum Statetype handleInCharState(int c) {
   enum Statetype state;

   /* Move back to NORMAL state if single quote character is
      found. */
   if (c == '\'') {
         state = NORMAL;
         putchar(c);
      }

   /* Move to ESCAPE_IN_STRING state to handle escaped
      characters following a backslash. */
   else if (c == '\\') {
      putchar(c);
      state = ESCAPE_IN_CHAR;
   }

   /* Else stay in IN_STRING state. */
   else {
         state = IN_CHAR;
         putchar(c);
      }
      return state;
   }

/* Implement the SLASH state of the DFA. c is the current DFA
   character. Write c to stdout, or enter the IN_COMMENT state,
   and replace comment with space character, as specified by
   the DFA. Return the next state. */

enum Statetype handleSlashState(int c) {
   enum Statetype state;

   /* Move to IN_COMMENT state if a * is found. */
   if (c == '*') {
      putchar(' ');
      state = IN_COMMENT;
   }

   /* Stay in SLASH state if c is a forward slash. */
   else if (c == '/') {
      putchar(c);
      state = SLASH;
   }

   /* Move to IN_CHAR state if single quote character is
         found. */
   else if (c == '\'') {
      putchar('/');
      putchar(c);
      state = IN_CHAR;
   }
   /* Move to IN_STRING state if double quote character is
         found. */
   else if (c == '\"') {
      putchar('/');
      putchar(c);
      state = IN_STRING;
   }

   /* Else return to NORMAL state. */
   else {
      putchar('/');
      putchar(c);
      state = NORMAL;
   }
   return state;
}

/* Implement the IN_COMMENT state of the DFA. c is the current DFA
   character. Do not write c to stdout. Write newline character to
   stdout, as specified by DFA. Return the next state.*/

enum Statetype handleCommentState(int c) {
   enum Statetype state;

   /* Move to STAR state if * is found to check if this is the
      end of the comment. */
   if (c == '*') {
      state = STAR;
   }

   /* Output a newline character if c is a newline character. */
   else if (c == '\n') {
      putchar('\n');
      state = IN_COMMENT;
   }

   /* Else stay in IN_COMMENT state.*/
   else {
      state = IN_COMMENT;
   }
   return state;
}

/* Implement the STAR state of the DFA. c is the current DFA
   character. Do not write c to stdout. Write newline character to
   stdout, as specified by DFA. Return the next state. */

enum Statetype handleStarState(int c) {
   enum Statetype state;

   /* If c is forward slash, return to NORMAL state since comment
      terminates. */
   if (c == '/') {
      state = NORMAL;
   }

   /* If c is *, stay in STAR state. */
   else if (c == '*') {
      state = STAR;
   }

   /* Output a newline character if c is a newline character. */
   else if (c == '\n') {
      putchar('\n');
      state = IN_COMMENT;
   }

   /* Else, return to the IN_COMMENT state. */
   else {
      state = IN_COMMENT;
   }
   return state;
}

/* Implement the ESCAPE_IN_CHAR state of the DFA. c is the current
   DFA character. Write c to stdout. Return the next state. */

enum Statetype handleEscapedChar(int c) {
   enum Statetype state;

   /* Output char c as ordinary string and return to IN_CHAR
      state. */
   putchar(c);
   state = IN_CHAR;
   return state;
 }

/* Implement the ESCAPE_IN_STRING state of the DFA. c is the current
   DFA character. Write c to stdout. Return the next state. */

enum Statetype handleEscapedString(int c) {
   enum Statetype state;

    /* Output char c as ordinary string and return to IN_STRING
      state. */
   putchar(c);
   state = IN_STRING;
   return state;
}

/* Read C source code as text from stdin. Replace single-line comment
   with a space, multi-line comments with a space, followed by newline
   characters to preserve the original numbering. Recognize
   comments within a string or character literal. Handle escaped
   characters within string and character literals. Write the result
   to stdout. Return 0.

   Generate error in case of unterminated comment with
   number of line on which the unterminated comment begins. Write
   error to stderr. Return 1.*/

int main(void) {
   int c;

   /* Keeping track of number of lines in program. */
   int line = 1;

   /* Keep track of number of lines in a given comment until
      comment is terminated. */
   int commentLines = 0;

   /* Use a DFA approach. state indicates the DFA state;
     initialized to NORMAL state. */
   enum Statetype state = NORMAL;

   while ((c = getchar()) !=EOF) {
      if (c == '\n') {
         line++;
      }

      /* Counting the number of lines in a given comment. */
      if (c == '\n' && (state == IN_COMMENT || state == STAR)) {
         commentLines++;
      }

      /* If state returns to NORMAL, reset number of lines in comment
          to 0 since this means the comment has terminated. */
      if (state == NORMAL) {
         commentLines = 0;
      }
      switch (state) {
         case NORMAL:
            state = handleNormalState(c);
            break;
         case IN_STRING:
            state = handleInStringState(c);
            break;
         case IN_CHAR:
            state = handleInCharState(c);
            break;
         case SLASH:
            state = handleSlashState(c);
            break;
         case IN_COMMENT:
            state = handleCommentState(c);
            break;
         case STAR:
            state = handleStarState(c);
            break;
         case ESCAPE_IN_CHAR:
            state = handleEscapedChar(c);
            break;
         case ESCAPE_IN_STRING:
            state = handleEscapedString(c);
            break;
               }
   }
   if (state == SLASH) {
      putchar('/');
   }
   else if (state == IN_COMMENT || state == STAR) {
      /* If comment is left unterminated, subtracting number of lines
         in unterminated comment from number of lines in program to
         obtain starting line of this comment. */
      line = line - commentLines;
      fprintf(stderr, "Error: line %d: unterminated comment\n", line);
      return 1;
   }
   return 0;
}



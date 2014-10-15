#include <string>
#include <iostream>
#include <fstream>
#include <direct.h>

using namespace std;

int main(int argc, char** argv)
{
    char* buffer;
    if( (buffer = _getcwd( NULL, 0 )) == NULL )
        perror( "_getcwd error" );

    string workingDir = buffer;
    workingDir = workingDir.substr(0, workingDir.find_last_of('\\') + 1);
    ifstream in("output.last");

    while (!in.eof())
    {
        string input;
        getline(in, input);

		if (input.find(": fatal error: ") != string::npos)
		{
			input = input.replace(input.find(": fatal"), 7, ":");
		}

        if (input.find(": error: ") != string::npos)
        {
            //main.c:7:2: error: expected ';' before 'return'
            int fileIndex = input.find_first_of(".c:") + 2;
            //string file = "" + workingDir + input.substr(0, fileIndex) + "";
            string file = input.substr(0, fileIndex);
            input = input.substr(fileIndex + 1);

            int errorIndex = input.find(' ');
            string errors = "(" + input.substr(0, errorIndex-1) + "):";
            errors = errors.replace(errors.find_first_of(':'), 1, ",");
            input = input.substr(errorIndex);

            input = file + errors + input;
        }

        cerr << input << endl;
    }

    in.close();
}

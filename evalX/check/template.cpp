#include <bits/stdc++.h>
using namespace std; // Najtoplije preporucam da kod ne uredjujete iznad 45. linije! :)

char readChar(ifstream& in){
	in.exceptions(ifstream::failbit | ifstream::badbit | ifstream::eofbit);
	try {
		char ret; 
		in >> ret;
		return ret;
	}
	catch (ifstream::failure const& ex){
		cout << "Greska pri citanju chara, PE\n";
		exit(0);
	}
}

string readString(ifstream& in){
	in.exceptions(ifstream::failbit | ifstream::badbit | ifstream::eofbit);
	try {
		string ret; 
		in >> ret;
		return ret;
	}
	catch (ifstream::failure const& ex){
		cout << "Greska pri citanju stringa, PE\n";
		exit(0);
	}
}

long long readInt(ifstream& in){
	in.exceptions(ifstream::failbit | ifstream::badbit | ifstream::eofbit);
	try {
		long long ret; 
		in >> ret;
		return ret;
	}
	catch (ifstream::failure const& ex){
		cout << "Greska pri citanju inta, PE\n";
		exit(0);
	}
}

////////////////////////////////////////////////////////////////////////////////////
//// Nacin za sigurno citanje long long / char / string. Toplo se preporucuje! /////
////////////////////////////////////////////////////////////////////////////////////

int n;
void readInput(string PUTANJA){
	cout << "Citanje inputa s C:\\eval\\"+PUTANJA << endl;
	ifstream fin; fin.open("C:\\eval\\"+PUTANJA); // Ovu liniju ne mijenjanti!
	fin >> n; cout << n << endl;
	n = readInt(fin);
	// unos svih podataka
	return;
}

int ans;
void readOutput(string PUTANJA){ // return 1
	cout << "Citanje outputa s C:\\eval\\"+PUTANJA << endl;
	ifstream fin; fin.open("C:\\eval\\"+PUTANJA); // Ovu liniju ne mijenjanti!
	ans = readInt(fin);
	// unos svih podataka
	exit(0); // ako nije dosegnut kraj filea, rješenje nece biti prihvaceno
	return;
}

int main(int argc, char* argv[]){
	cout << "Pokrenut je checker!"; 
	readInput(argv[1]);
	readOutput(argv[2]);
	if (ans%n==0) return 1;
	else return 0;
}

// Compile --> Terminal ./script_gen.exe
#include <bits/stdc++.h>
using namespace std;

unordered_map<int, string> para = {
    {0, "none"}, {1, "pos_Q"}, {2, "pos_W"}, {3, "pos_E"}, {4, "pos_A"},
    {5, "pos_S"}, {6, "pos_D"}, {7, "pos_Z"}, {8, "pos_X"}, {9, "pos_C"}, 
    {10, "DAMAGE"}, {11, "READY"}
};

string make(int n, int enemy){
    string s = "";
    s += ("12\'d" + to_string(n) + ": pos_0 = " + para[enemy] + ";");
    if(n % 2 == 0) s += "\t";
    else s += "\n";
    return s;
}

int main(){
    int n = 0;
    vector<int> enemy = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 5, 3, 9, 2, 1, 5, 
        1, 4, 7, 2, 5, 8, 3, 9, 9, 6, 8, 7, 4, 1, 4
    };
    for(int i=0 ; i<enemy.size() ; i++){
        cout << make(n, 11);
        n++;
        for(int j=1 ; j<19 ; j++){
            cout << make(n, enemy[i]);
            n++;
        }
        cout << make(n, 10);
        n++;
        for(int j=0 ; j<8 ; j++){
            cout << make(n, 0);
            n++;
        }
    }
    return 0;
}
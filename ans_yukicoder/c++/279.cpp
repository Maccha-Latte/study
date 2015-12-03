#include <iostream>
#include <string>
#include <vector>
#include <cstring>
#include <climits>
#include <algorithm>
#include <map>
using namespace std;

int main() {
    int t_count = 0, r_count = 0, e_count = 0;
    string s;
    cin >> s;
    for (int i=0; i<(int)s.size(); i++) {
        if (s[i] == 't') t_count ++;
        if (s[i] == 'r') r_count ++;
        if (s[i] == 'e') e_count ++;
    }
    cout << min(t_count, min(r_count, e_count/2)) << endl;
    return 0;
}
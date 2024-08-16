#include <iostream>
using namespace std;

int main() {
    int n, q;
    cin >> n >> q;
    int call_amounts[n];
    cin >> call_amounts[0];
    for (int i = 1; i < n; i++){
        cin >> call_amounts[i];
        call_amounts[i] += call_amounts[i-1];
    }

    int s, t;
    for (int i = 0; i < q; i++){
        cin >> s >> t;
        if (s == 1){
            cout << call_amounts[t-1] << endl;
            continue;
        }
        cout << call_amounts[t-1] - call_amounts[s-2] << endl;
    }

    return 0;
}
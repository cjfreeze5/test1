#include "Project3a.h"

//constructors
Account::Account() {
    accountName = "none";
}
Account::Account(string newName) {
    accountName = newName;
}

void Account::SetName(string newName) {
    accountName = newName;
}

set<string> Account::GetFollowers() {
    return followers;
}

//insert edges
void Account::InsertFollower(string newFollower) {
    followers.insert(newFollower);
}
void Account::InsertFollowing(string newFollowing) {
    following.insert(newFollowing);
}

//print edges based on this account - FOR DEBUGGING
void Account::PrintFollowers() {
    set<string>::iterator iter;
    cout << "Followers of the account \'" << accountName << "\':" << endl;
    for (iter = followers.begin(); iter != followers.end(); ++iter) {
        cout << *iter << endl;
    }
}
void Account::PrintFollowing() {
    set<string>::iterator iter;
    cout << "The account \'" << accountName << "\' is following: " << endl;
    for (iter = following.begin(); iter != following.end(); ++iter) {
        cout << *iter << endl;
    }
}

//accessors
int Account::GetNumFollowers() {
    return followers.size();
}
int Account::GetNumFollowing() {
    return following.size();
}
string Account::GetName() {
    return accountName;
}
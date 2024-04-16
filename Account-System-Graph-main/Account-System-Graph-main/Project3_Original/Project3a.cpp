#include "Project3a.h"

//constructors
Account::Account() {
    accountName = "none";
    root_dist = -1;
}
Account::Account(string newName) {
    accountName = newName;
    root_dist = -1;
}
Account::Account(string newName, int newDist) {
    accountName = newName;
    root_dist = newDist;
}
void Account::SetName(string newName) {
    accountName = newName;
}

void Account::SetRootDist(int newDist) {
    root_dist = newDist;
}

vector<Account*> Account::GetFollowers() {
    return followers;
}

//insert edges
void Account::InsertFollower(Account* newFollower) {
    bool duplicate = false;
    for (unsigned int i = 0; i < followers.size(); ++i) {
        if (followers.at(i)->GetName() == newFollower->GetName()) {
            duplicate = true;
        }
    }
    if (!duplicate) {
        followers.push_back(newFollower);
    }
}
void Account::InsertFollowing(Account* newFollowing) {
    bool duplicate = false;
    for (unsigned int i = 0; i < following.size(); ++i) {
        if (following.at(i)->GetName() == newFollowing->GetName()) {
            duplicate = true;
        }
    }
    if (!duplicate) {
        following.push_back(newFollowing);
    }

}

//print edges based on this account - FOR DEBUGGING
void Account::PrintFollowers() {
    cout << "Followers of the account \'" << accountName << "\':" << endl;
    for (unsigned int i = 0; i < followers.size(); ++i) {
        cout << followers.at(i)->GetName() << endl;
    }
}
void Account::PrintFollowing() {
    cout << "The account \'" << accountName << "\' is following: " << endl;
    for (unsigned int i = 0; i < following.size(); ++i) {
        cout << following.at(i)->GetName() << endl;
    }
}

//accessors
int Account::GetNumFollowers() {
    return followers.size();
}
int Account::GetNumFollowing() {
    return following.size();
}
int Account::GetRootDist() {
    return root_dist;
}
string Account::GetName() {
    return accountName;
}

void Account::SortFollowers() {
    unsigned int i, j;
    Account *temp;

    for (i = 1; i < followers.size(); ++i) {
        j = i;

        while (j > 0 && followers.at(j)->GetName() < followers.at(j-1)->GetName()) {
            temp = followers.at(j);
            followers.at(j) = followers.at(j - 1);
            followers.at(j - 1) = temp;
            --j;
        }
    }
}
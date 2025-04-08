using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using MemoryGame.Service;

namespace MemoryGame.ViewModel
{
    class About : INotifyPropertyChanged
    {
        private string _studentName;
        public string StudentName
        {
            get => _studentName;
            set
            {
                _studentName = value;
                OnPropertyChanged(nameof(StudentName));
            }
        }

        private string _email;
        public string Email
        {
            get => _email;
            set
            {
                _email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        private string _groupNumber;
        public string GroupNumber
        {
            get => _groupNumber;
            set
            {
                _groupNumber = value;
                OnPropertyChanged(nameof(GroupNumber));
            }
        }

        private string _specialization;
        public string Specialization
        {
            get => _specialization;
            set
            {
                _specialization = value;
                OnPropertyChanged(nameof(Specialization));
            }
        }

        public ICommand OpenEmailCommand { get; }
        public ICommand CloseWindowCommand { get; }

        public About()
        {
            StudentName = "Năstase Teodor";
            Email = "teodor-a.nastase@student.unitbv.ro";
            GroupNumber = "Group: 10LF233";
            Specialization = "Specialization: Informatică";
            OpenEmailCommand = new RelayCommand(OpenEmail);
            CloseWindowCommand = new RelayCommand(CloseAboutWindow);
        }

        private void OpenEmail(object parameter)
        {
            if (parameter is System.Uri emailUri)
            {
                Process.Start(new ProcessStartInfo("mailto:" + emailUri.OriginalString)
                {
                    UseShellExecute = true
                });
            }
        }

        private void CloseAboutWindow(object parameter)
        {
            if (parameter is System.Windows.Window window)
            {
                window.Close();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class CRFBenificiariesObject
    {
        private int _id;
        private int _districtId;
        private int _noOfBenificiaries;
        private int _male;
        private int _female;
        private decimal _firstRoundAmountFirstTranche;
        private decimal _firstRoundAmountSecondTranche;
        private decimal _secondRoundAmountFirstTranche;
        private decimal _secondRoundAmountSecondTranche;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public int DistrictId
        {
            get { return _districtId; }
            set { _districtId = value; }
        }

        public int NoOfBenificiaries
        {
            get { return _noOfBenificiaries; }
            set { _noOfBenificiaries = value; }
        }

        public int Male
        {
            get { return _male; }
            set { _male = value; }
        }

        public int Female
        {
            get { return _female; }
            set { _female = value; }
        }

        public decimal FirstRoundAmountFirstTranche
        {
            get { return _firstRoundAmountFirstTranche; }
            set { _firstRoundAmountFirstTranche = value; }
        }

        public decimal FirstRoundAmountSecondTranche
        {
            get { return _firstRoundAmountSecondTranche; }
            set { _firstRoundAmountSecondTranche = value; }
        }

        public decimal SecondRoundAmountFirstTranche
        {
            get { return _secondRoundAmountFirstTranche; }
            set { _secondRoundAmountFirstTranche = value; }
        }

        public decimal SecondRoundAmountSecondTranche
        {
            get { return _secondRoundAmountSecondTranche; }
            set { _secondRoundAmountSecondTranche = value; }
        }

    }
}
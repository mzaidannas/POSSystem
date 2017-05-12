using DAL;
using POSSystem.DataModels;

namespace POSSystem.BLL
{
    public class UserLogic
    {
        POSDatabaseEntities db = new POSDatabaseEntities();
        public UserLogic()
        {
        }

        public DatatableResponse<User> SaveUser(User userProfile)
        {

        }

        //public DatatableResponse<User> FetchUserList(User userProfile, DatatableRequest<string, User> paging)
        //{

        //}

        //public DatatableResponse<User> FetchUserById(User userProfile, DatatableRequest<string, User> paging)
        //{

        //}
    }
}

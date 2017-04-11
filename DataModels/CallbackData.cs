namespace POSSystem.DataModels
{
    /// <summary>
    /// Model for returning Data from any action
    /// </summary>
    /// <typeparam name="T">Datatype to return</typeparam>
    public class CallBackData<T>
    {
        public Message msg = new Message();
        public DatatableResponse<T> tableData = new DatatableResponse<T>();
    }
}
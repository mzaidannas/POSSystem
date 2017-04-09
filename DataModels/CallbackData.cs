namespace POSSystem.DataModels
{
    /// <summary>
    /// Model for returning Data from any action
    /// </summary>
    /// <typeparam name="T">Datatype to return</typeparam>
    public class CallBacknData<T>
    {
        public Message msg = new Message();
        public DatatableResponse<T> tableData { get; set; }
    }
}
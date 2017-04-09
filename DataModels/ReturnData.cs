namespace POSSystem.DataModels
{
    /// <summary>
    /// Model for returning Data from any action
    /// </summary>
    /// <typeparam name="T">Datatype to return</typeparam>
    public class ReturnData<T>
    {
        public Message msg = new Message();
        public T Data { get; set; }
    }
}

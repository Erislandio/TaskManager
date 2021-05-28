pragma solidity >=0.4.22 <0.9.0;

contract TaskManager {

    uint public nTasks;

    enum TaskPhase {
        ToDo,
        InProgress,
        Done,
        Blocked,
        Review,
        Postpoend,
        Canceled
    }

    struct TaskStruct {
        address owner;
        string name;
        TaskPhase phase;
        uint priority;
    }

    TaskStruct[] private tasks;
    
    mapping (address => uint[]) private myTasks;

    event TaskAdded(address owner, string name, TaskPhase phase, uint priority);

    modifier onlyOwner (uint _taskIndex) {
        if (tasks[_taskIndex].owner == msg.sender) {
            _;
        }
    }

    constructor() public {
        addTask("Create task manager", TaskPhase.Done, 1);
        addTask("Create your first task", TaskPhase.Done, 1);
        addTask("Clean your house", TaskPhase.Done, 1);
    }

    function getTask(uint index) public view returns (address owner, string memory name, TaskPhase phase, uint prioriry) {
        owner = tasks[index].owner;
        name = tasks[index].name;
        phase = tasks[index].phase;
        prioriry = tasks[index].priority;
    }

    function listMyTasks() public view returns (uint memory) {
        return myTasks[msg.sender];
    }

    function addTask(string memory name, TaskPhase phase, uint priority) public returns (uint index) {

    }

}